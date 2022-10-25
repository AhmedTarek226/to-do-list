import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/models/task.dart';
import 'package:to_do_app/core/providers/tasks_provider.dart';

class AddTaskWidget extends StatefulWidget {
  AddTaskWidget({Key? key}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  Task newTask = Task(title: "", date: DateTime.now());

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: newTask.date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != newTask.date) {
      setState(() {
        newTask.date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var tasksProvider = Provider.of<TasksProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Task Title"),
                prefixIcon: Icon(Icons.task),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                newTask.title = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field is required";
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                        "${newTask.date.day.toString()} / ${newTask.date.month.toString()} / ${newTask.date.year.toString()}"),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  tasksProvider.addTask(newTask);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${newTask.title} Added'),
                    ),
                  );
                  _formKey.currentState!.deactivate();
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
