import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/views/task_screen.dart';
import 'package:todolist/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(home: TasksScreen()),
    );
  }
}
