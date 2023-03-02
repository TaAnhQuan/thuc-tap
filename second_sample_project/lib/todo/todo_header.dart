import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_sample_project/block/todo_block.dart';
import 'package:second_sample_project/event/add_todo_event.dart';

class TodoHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var block = Provider.of<TodoBlock>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(
              labelText: 'Add todo',
              hintText:  'Add todo',
            ),
          ),
        ),

        SizedBox(width: 20),

        Container(
          child: ElevatedButton.icon(
            onPressed: (){
              block.event.add(AddTodoEvent(txtTodoController.text));
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
          ),
        ),
      ],
    );
  }
}
