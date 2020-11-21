import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  final Function taskDelete;

  TasksTile(
      {this.isChecked, this.taskTitle, this.checkboxCallBack, this.taskDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff191C1F),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              color: Colors.white,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.white,
          checkColor: Colors.black,
          value: isChecked,
          onChanged: checkboxCallBack,
        ),
        onLongPress: taskDelete,
      ),
    );
  }
}
