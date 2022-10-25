import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/models/task.dart';

class TasksProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: "Go to gym", date: DateTime.now()),
    Task(title: "Study react", date: DateTime.now()),
    Task(title: "study flutter", date: DateTime.now()),
  ];

  List<Task> get getTasks {
    return _tasks;
  }

  List<Task> get getCompleted {
    return _tasks.where((task) => task.completed == true).toList();
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskState(String taskTitle) {
    Task t = _tasks.firstWhere((task) => task.title == taskTitle);
    t.completed = !t.completed;
    notifyListeners();
  }

  void removeTask(String taskTitle) {
    _tasks.removeWhere((task) => task.title == taskTitle);
    notifyListeners();
  }
}
