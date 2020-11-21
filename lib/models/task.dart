class Task {
  bool isDone;
  final String name;

  Task({this.isDone = false, this.name});

  void toggleDone() {
    isDone = !isDone;
  }
}
