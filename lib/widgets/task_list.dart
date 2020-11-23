import 'package:flutter/material.dart';
import 'package:todolist/models/task_helper.dart';
import 'package:todolist/widgets/task_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  String uid;

  @override
  void initState() {
    super.initState();
    uid = TaskHelper().getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(uid)
          .where("isRemove", isEqualTo: false)
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
                  'Fetching Data',
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
            return TasksTile(
              taskTitle: tasks['title'],
              isChecked: tasks['isDone'],
              checkboxCallBack: (checkboxState) {
                TaskHelper().updateTask(tasks);
              },
              longPressedRemoveTask: () {
                TaskHelper().removeTask(tasks);
              },
            );
          },
        );
      },
    );
  }
}
