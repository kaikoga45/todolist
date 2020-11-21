import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';
import 'package:todolist/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TasksTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallBack: (checkboxState) {
              taskData.updateTask(task);
            },
            taskDelete: () {
              taskData.removeTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
        scrollDirection: Axis.vertical,
      );
    });
  }
}
