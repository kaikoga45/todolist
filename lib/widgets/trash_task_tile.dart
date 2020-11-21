import 'package:flutter/material.dart';

class TrashTasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function iconRestoreCallBack;
  final Function longPressedDeleteTask;

  TrashTasksTile(
      {this.isChecked,
      this.taskTitle,
      this.iconRestoreCallBack,
      this.longPressedDeleteTask});

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
        trailing: IconButton(
          icon: Icon(
            Icons.restore,
            color: Colors.white,
          ),
          onPressed: iconRestoreCallBack,
        ),
        onLongPress: longPressedDeleteTask,
      ),
    );
  }
}
