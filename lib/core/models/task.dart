import 'package:flutter/material.dart';

class Task {
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String reminder;
  final String repeat;
  bool completed;
  bool uncompleted;
  bool favorite;

  Task({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.repeat,
    required this.completed,
    required this.uncompleted,
    required this.favorite,
  });
}
