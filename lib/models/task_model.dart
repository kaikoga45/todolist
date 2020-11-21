class Task {
  int id;
  String title;
  bool isDone;

  Task({this.title, this.isDone});
  Task.withId({this.id, this.title, this.isDone});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['isDone'] = isDone;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
        id: map['id'], title: map['title'], isDone: map['isDone']);
  }
}
