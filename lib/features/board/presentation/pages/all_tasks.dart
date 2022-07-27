import 'package:flutter/material.dart';
import 'package:to_do_app/features/board/presentation/widgets/task_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/add_task/presentation/pages/add_task_page.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.w),
              child: TaskWidget(),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
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
