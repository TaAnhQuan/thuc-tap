import 'package:second_sample_project/base/base_event.dart';

class AddTodoEvent extends BaseEvent{
  String content;

  AddTodoEvent(this.content);

}