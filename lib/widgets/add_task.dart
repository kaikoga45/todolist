import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    DateTime taskDeadline = DateTime.now();

    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xff181B1F),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              newTaskTitle = newValue;
            },
          ),
          FlatButton(
            color: Colors.white,
            child: Icon(
              Icons.add,
              size: 25.0,
            ),
            onPressed: () {
              Provider.of<TaskData>(context).addTask(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
