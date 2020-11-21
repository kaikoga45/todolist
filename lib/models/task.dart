class Task {
  String id;
  bool isDone;
  final String name;

  Task({this.isDone = false, this.name, this.id});

  void toggleDone() {
    isDone = !isDone;
  }
}
