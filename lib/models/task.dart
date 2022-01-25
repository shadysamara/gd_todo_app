class Task {
  int id;
  String title;
  bool isComplete;
  Task({this.id, this.title, this.isComplete = false});
  toMap() {
    return {'title': this.title, 'isCompletee': this.isComplete ? 1 : 0};
  }
}
