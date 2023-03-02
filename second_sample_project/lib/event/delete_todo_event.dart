import 'package:second_sample_project/base/base_event.dart';
import 'package:second_sample_project/model/todo.dart';

class DeleteTodoEvent extends BaseEvent{
  Todo todo;
  DeleteTodoEvent(this.todo);
}