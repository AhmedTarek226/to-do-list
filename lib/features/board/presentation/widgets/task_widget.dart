import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/models/task.dart';
import 'package:to_do_app/core/providers/tasks_provider.dart';

class TaskWidget extends StatelessWidget {
  Task task = Task(title: "", date: DateTime.now());
  TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider = Provider.of<TasksProvider>(context);
    return Dismissible(
      key: Key(task.title),
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Theme.of(context).primaryColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        tasksProvider.removeTask(task.title);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${task.title} deleted')));
      },
      child: Row(
        children: [
          Checkbox(
              checkColor: Colors.white,
              focusColor: Theme.of(context).primaryColor,
              value: task.completed,
              onChanged: (value) {
                tasksProvider.toggleTaskState(task.title);
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.task.title,
                style: (task.completed
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).primaryColor,
                        decorationThickness: 2,
                        color: Colors.grey,
                        fontSize: 16)
                    : TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${task.date.day.toString()}/${task.date.month.toString()}/${task.date.year.toString()}",
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
