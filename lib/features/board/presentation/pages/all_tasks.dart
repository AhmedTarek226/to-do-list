import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/providers/tasks_provider.dart';
import 'package:to_do_app/features/board/presentation/widgets/task_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/add_task/presentation/pages/add_task_page.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TasksProvider>(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ListView.builder(
            itemCount: tasks.getTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: TaskWidget(task: tasks.getTasks[index]),
              );
            },
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Text('Add Task'),
            onPressed: () {
              Navigator.of(context).pushNamed(AddTask.routeName);
            },
          ),
        ),
      ],
    );
  }
}
