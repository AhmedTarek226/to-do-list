import 'package:flutter/material.dart';
import 'package:to_do_app/features/add_task/presentation/widgets/add_task_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  static String routeName = '/add_task_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Add Task',
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){},),
      ),
      body: AddTaskWidget(),
    );
  }
}
