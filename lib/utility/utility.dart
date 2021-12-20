import 'package:flutter/material.dart';

List<String> labelTodo = [
  'Generico',
  'Sport',
  'Lavoro',
  'Hobby',
  'Famiglia',
  'Salute'
];

class Utility {
  static final labelMap = <String, Color>{
    labelTodo[0]: Colors.cyan.shade200,
    labelTodo[1]: Colors.blue.shade700,
    labelTodo[2]: Colors.red.shade300,
    labelTodo[3]: Colors.green.shade600,
    labelTodo[4]: Colors.brown.shade400,
    labelTodo[5]: Colors.orange.shade400,
  };
}
