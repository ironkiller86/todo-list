import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/utility/utility.dart';

/*
 * 
 */
class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

/*
 * 
 */
class _AddTaskState extends State<AddTask> {
  var myController = TextEditingController();
  bool _disabledBtn = true;
  String _dropdownValue = 'Generico';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController = TextEditingController();
    myController.addListener(() {
      final _disabledBtn = myController.text.isEmpty;
      setState(() => this._disabledBtn = _disabledBtn);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_dropdownValue);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Todo List"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tipo di Task',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurpleAccent[700])),
                    DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.grey[100],
                      value: _dropdownValue,
                      items: labelTodo.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                  color: Utility.labelMap[value],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        );
                      }).toList(),
                      hint: Text(
                        'Tipo di Task',
                        style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _dropdownValue = newValue as String;
                        });
                      },
                    ),
                  ],
                )),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(10),
                            right: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('Cosa devi fare?',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurpleAccent[700],
                                  )),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Center(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 25,
                                          offset: Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.edit,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.clear,
                                              color: Colors.grey[800]),
                                          onPressed: () {
                                            myController.clear();
                                          },
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        hintText: 'Aggiungi task',
                                      ),
                                      controller: myController,
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                  child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: !_disabledBtn
                                        ? Colors.deepPurple
                                        : Colors.deepPurple.withOpacity(0.6),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100))),
                                child: IconButton(
                                  iconSize: 28,
                                  onPressed: _disabledBtn
                                      ? null
                                      : () {
                                          Navigator.pop(
                                              context,
                                              Todo(myController.text, false,
                                                  _dropdownValue)); // Close the add todo screen
                                        },
                                  icon: const Icon(Icons.check),
                                  color: Colors.white,
                                ),
                              ))),
                        ],
                      ))),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ));
  }
}
