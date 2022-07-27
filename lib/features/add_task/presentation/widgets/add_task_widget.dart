import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskWidget extends StatefulWidget {

  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Title'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 30.h,
              width: 320.w,
              color: Colors.grey[100],
              child: TextFormField()),
        ],
      ),
    );
  }
}
