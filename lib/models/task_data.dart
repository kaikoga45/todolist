import 'dart:collection';
import 'package:todolist/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy ROG'),
    Task(name: 'Buy Car'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newValue) {
    _tasks.add(Task(name: newValue));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
