import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  Header(this.numberTasks, {Key? key}) : super(key: key);

  final int numberTasks;
  final date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<String> data =
        DateFormat('EEEE, d MMMM, yyyy').format(date).split(',');

    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${data[0]},${data[2]}',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.deepPurpleAccent[700],
                  ),
                ),
                Text(
                  '$numberTasks Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  data[1].trim(),
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey[800],
                  ),
                )),
          ],
        ));
  }
}
