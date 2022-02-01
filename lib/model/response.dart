import 'package:todo_list/model/todo.dart';

class Response {
  bool status;
  String message;
  List<Todo> todos;

  Response({this.status = false, this.message = "", required this.todos});

  factory Response.fromJson(dynamic json) {
    var todosObjJson = json['data'] as List;
    List<Todo> _todos =
        todosObjJson.map((todoJson) => Todo.fromJson(todoJson)).toList();

    return Response(
        status: json['status'] == 'Success',
        message: json['message'] == null ? "" : json['message'],
        todos: _todos);
  }
}
