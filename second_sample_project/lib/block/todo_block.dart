import 'dart:async';
import 'dart:math';
import 'package:second_sample_project/base/base_block.dart';
import 'package:second_sample_project/base/base_event.dart';
import 'package:second_sample_project/db/todo_table.dart';
import 'package:second_sample_project/model/todo.dart';
import 'package:second_sample_project/event/add_todo_event.dart';
import 'package:second_sample_project/event/delete_todo_event.dart';


class TodoBlock extends BaseBlock{

  TodoTable _todoTable = TodoTable();

  StreamController<List<Todo>> _todoListController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListController.stream;

  var _randomInt = Random();
  List<Todo> _todoListData = <Todo>[];

  initData() async{
    await _todoTable.selectAllTodo();

    if(_todoListData == null){
      return;
    }
  }

  _addTodo(Todo todo) async{

    //insert to database
    await _todoTable.insertTodo(todo);

    _todoListData.add(todo);
    _todoListController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async{

    await _todoTable.deleteTodo(todo);

    _todoListData.remove(todo);
    _todoListController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
    if (event is AddTodoEvent){
      Todo todo = Todo.fromData(_randomInt.nextInt(10000), event.content);
      _addTodo(todo);
    }else if (event is DeleteTodoEvent){
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListController.close();
  }
  
  
}