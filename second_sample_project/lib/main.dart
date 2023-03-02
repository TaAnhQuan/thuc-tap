import 'package:flutter/material.dart';
import 'package:second_sample_project/block/todo_block.dart';
import 'package:second_sample_project/db/todo_database.dart';
import 'todo/todo_list_container.dart';
import 'package:provider/provider.dart';

void main() async{
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Todo List'),),
          body: Provider<TodoBlock>.value(
              value: TodoBlock(),
              child: TodoListContainer(),
          ),
      ),
    );
  }
}




