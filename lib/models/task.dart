class Task {
  int id;
  String title;
  bool isComplete;
  Task({this.id, this.title, this.isComplete = false});
  Task.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.isComplete = map['isComplete'] == 1 ? true : false;
  }
  toMap() {
    return {'title': this.title, 'isComplete': this.isComplete ? 1 : 0};
  }
}
