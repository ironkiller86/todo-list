import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'components/header.dart';
import './components/task_row.dart';
import 'package:http/http.dart' as http;
import '../add_task.dart';
import 'dart:convert';
import 'package:todo_list/model/response.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _Home();
}

class _Home extends State<HomeState> {
  List<Todo> _todoList = [];
  bool loading = false;
// Future<List<dynamic>>? _newTodoList;

  fetchPost() async {
    setState(() => loading = true);
    final response = await http.get(Uri.parse(
        /* 'https://jsonplaceholder.typicode.com/todos' */ 'https://desolate-cove-52415.herokuapp.com/api/todos'));

    if (response.statusCode == 200) {
      print(response.body);
      Response resp = Response.fromJson(jsonDecode(response.body));
      print(resp.status);
      print(resp.message);
      print(resp.todos[0].description);

      setState(() {
        _todoList = resp.todos;
        loading = false;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  void changeTodoState(int index, checkboxFlag) {
    /* print(checkBoxFlag); */
    Todo todo = _todoList.elementAt(index);
    todo.completed = checkboxFlag;
    /*  print('${todo.description}- ${todo.completed}'); */
    setState(() {
      _todoList[index] = todo;
    });

    setState(() {
      //  _todoList.elementAt(index).completed = checkboxFlag;
    });
  }

  void deleteTask(int id) async {
    setState(() => loading = true);
    final response = await http.delete(
        Uri.parse('https://desolate-cove-52415.herokuapp.com/api/todos/$id'));
    if (response.statusCode == 200) {
      setState(() =>
          {_todoList.removeWhere((todo) => todo.id == id), loading = false});
    } else {
      print(response.statusCode);
      print('Error while deleting');
      setState(() => loading = false);
    }
  }

/*
 * add Todo
 */
  void _addTodo(BuildContext contex) async {
    final Todo todo;
    try {
      todo = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddTask()),
      );
    } catch (err) {
      print('Caught error: $err');
      return;
    }
    setState(() => loading = true);
    final response = await http.post(
        Uri.parse('https://desolate-cove-52415.herokuapp.com/api/todos'),
        body: Todo.todoToJson(todo));
    print(response.statusCode);
    if (response.statusCode == 201) {
      setState(() => {_todoList.add(todo), loading = false});
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(loading);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Header(_todoList.length),
                Expanded(
                    child: ListView.builder(
                        itemCount: _todoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskRow(
                              todo: _todoList[index],
                              toggleCheckbox: (bool flag) =>
                                  changeTodoState(index, flag),
                              deleteTask: () => deleteTask(
                                    _todoList[index].id,
                                  ));
                        }))
              ],
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Aggiungi Task',
        onPressed: () => {_addTodo(context)},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
