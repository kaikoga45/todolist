import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addTask(Task task) async {
    try {
      await firestore.collection("tasks").add({
        "title": task.name,
        "isDone": task.isDone,
        "isRemove": false,
      }).then((value) {
        task.id = value.id;
      });
    } catch (e) {
      print(e);
    }
  }

  void updateTask(DocumentSnapshot task) {
    try {
      firestore
          .collection('tasks')
          .doc(task.id)
          .update({'isDone': task['isDone'] == false ? true : false});
    } catch (e) {
      print(e);
    }
  }

  void removeTask(DocumentSnapshot task) {
    try {
      firestore.collection('tasks').doc(task.id).update({'isRemove': true});
    } catch (e) {
      print(e);
    }
  }

  void deleteTask(DocumentSnapshot task) {
    try {
      firestore.collection('tasks').doc(task.id).delete();
    } catch (e) {
      print(e);
    }
  }

  void restoreTaskList(DocumentSnapshot task) {
    try {
      firestore.collection('tasks').doc(task.id).update({'isRemove': false});
    } catch (e) {
      print(e);
    }
  }
}
