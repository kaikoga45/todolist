import 'package:flutter/material.dart';
import 'package:todolist/models/task_helper.dart';
import 'package:todolist/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

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
              TaskHelper().addTask(
                Task(name: newTaskTitle),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
