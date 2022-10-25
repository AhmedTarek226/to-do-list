class Task {
  String title;
  DateTime date;
  bool completed;

  Task({
    required this.title,
    required this.date,
    this.completed = false,
  });
}
