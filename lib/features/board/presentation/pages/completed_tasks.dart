import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/providers/tasks_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/task_widget.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TasksProvider>(context);

    return ListView.builder(
      itemCount: tasks.getCompleted.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: TaskWidget(task: tasks.getCompleted[index]),
        );
      },
    );
  }
}
