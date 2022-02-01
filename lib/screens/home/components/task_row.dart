import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/utility/utility.dart';

class TaskRow extends StatelessWidget {
  final ValueChanged<bool> toggleCheckbox;
  final VoidCallback deleteTask;
  final Todo todo;

  const TaskRow({
    Key? key,
    required this.toggleCheckbox,
    required this.deleteTask,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      /*  child: GestureDetector(
          onTap: () {
            toggleCheckbox(!completed);
          },*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Utility.labelMap[todo.label],
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10), right: Radius.circular(10)),
                border: Border.all(
                    width: 1.0,
                    color:
                        Utility.labelMap[/* todo.label */ 'Hobby'] as Color)),
            margin: const EdgeInsets.only(left: 8, bottom: 5),
            child: Center(
              child: Text(
                todo.label,
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                        value: todo.completed,
                        onChanged: (bool? value) {
                          toggleCheckbox(value!);
                        }),
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(todo.description,
                        style: todo.completed == true
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : null),
                  )),
              Expanded(
                flex: 1,
                child: todo.completed == true
                    ? SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.delete),
                            color: Colors.grey[600],
                            tooltip: 'Elimina Task',
                            onPressed: () => deleteTask()))
                    : Container(),
              )
            ],
          ),
        ],
      ),
      /* ) */
    );
  }
}
