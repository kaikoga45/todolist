import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/models/task.dart';

class TaskHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;

  String getUserID() {
    //Get the current user id
    User user = auth.currentUser;
    uid = user.uid;
    return uid;
  }

  void addTask(Task task) async {
    //Adding task to the firebase
    User user = auth.currentUser;
    uid = user.uid;
    try {
      await firestore.collection(uid).add({
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
    //Updating the mark check status unto firebase
    User user = auth.currentUser;
    uid = user.uid;
    try {
      firestore
          .collection(uid)
          .doc(task.id)
          .update({'isDone': task['isDone'] == false ? true : false});
    } catch (e) {
      print(e);
    }
  }

  void removeTask(DocumentSnapshot task) {
    //Remove the task from the task list into recycle bin
    User user = auth.currentUser;
    uid = user.uid;
    try {
      firestore.collection(uid).doc(task.id).update({'isRemove': true});
    } catch (e) {
      print(e);
    }
  }

  void deleteTask(DocumentSnapshot task) {
    //Delete the task on firebase
    User user = auth.currentUser;
    uid = user.uid;
    try {
      firestore.collection(uid).doc(task.id).delete();
    } catch (e) {
      print(e);
    }
  }

  void restoreTaskList(DocumentSnapshot task) {
    //Restore task from recycle bin into task list
    User user = auth.currentUser;
    uid = user.uid;
    try {
      firestore.collection(uid).doc(task.id).update({'isRemove': false});
    } catch (e) {
      print(e);
    }
  }
}
