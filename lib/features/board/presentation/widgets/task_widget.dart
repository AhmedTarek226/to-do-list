import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.black,
            value: true,
            onChanged: (value){
              //todo
            }),
        SizedBox(width: 10.w,),
        const Text('Design team meeting'),
      ],
    );
  }
}
