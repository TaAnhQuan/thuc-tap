import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_sample_project/block/todo_block.dart';
import 'package:second_sample_project/event/delete_todo_event.dart';

import '../model/todo.dart';

class TodoList extends StatefulWidget {

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    var block = Provider.of<TodoBlock>(context);
    block.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBlock>(
      builder: (context, block, child) => StreamBuilder(
        stream: block.todoListStream,
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.active:
              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index){
                    print('data1');
                    return ListTile(
                      title: Text(snapshot.data![index].content ?? '', style: TextStyle(fontSize: 17),),
                      trailing: GestureDetector(
                        onTap: (){
                          block.event.add(DeleteTodoEvent(snapshot.data![index]));
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  });
            case ConnectionState.none:
            case ConnectionState.waiting:
            return Center(
              child: Container(
                width: 70,
                height: 70,
                child: Text('Empty', style: TextStyle(color: Colors.black)),
              ),
            );
            default:
              print('data2');
              return Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(),
                ),
              );
          }

        },

      ),
    );
  }
}
