import 'package:flutter/material.dart';
import 'package:todolist/models/task_helper.dart';
import 'package:todolist/widgets/trash_task_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrashTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("tasks")
          .where("isRemove", isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Fetching Recycle Bin',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot tasks = snapshot.data.documents[index];
            return TrashTasksTile(
              taskTitle: tasks['title'],
              isChecked: tasks['isDone'],
              iconRestoreCallBack: () {
                TaskData().restoreTaskList(tasks);
              },
              longPressedDeleteTask: () {
                TaskData().deleteTask(tasks);
              },
            );
          },
        );
      },
    );
  }
}