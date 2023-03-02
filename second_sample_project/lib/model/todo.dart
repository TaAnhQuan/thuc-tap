class Todo{
  int? _id;
  String? _content;

  Todo.fromData(id, content){
    this._id = id;
    this._content = content;
  }

  String? get content => this._content;

  set content(String? value){
    this._content = value;
  }

  int? get id => this._id;

  set id(int? value){
    this._id = value;
  }

  Map<String, dynamic> toMap(){
    return{
      'id' : _id,
      'content' : _content
    };
  }

}