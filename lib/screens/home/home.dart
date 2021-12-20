import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'components/header.dart';
import './components/task_row.dart';
import '../add_task.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _Home();
}

class _Home extends State<HomeState> {
  final List<Todo> _todoList = [];

  void changeTodoState(int index, checkboxFlag) {
    /* print(checkBoxFlag); */
    /*  Todo todo = _todoList.elementAt(index);
    todo.completed = checkboxFlag;
    /*  print('${todo.description}- ${todo.completed}'); */
    setState(() {
      _todoList[index] = todo;
    }); 
    */
    setState(() {
      _todoList.elementAt(index).completed = checkboxFlag;
    });
  }

  void deleteTask(
    int index,
  ) {
    setState(() => _todoList.removeAt(index));
  }

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
    setState(() => _todoList.add(todo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: Column(
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
                        deleteTask: () => deleteTask(index));
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
