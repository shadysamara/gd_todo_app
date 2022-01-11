import 'package:flutter/material.dart';
import 'package:todo_ui/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function function;
  Function deleteFunction;
  TaskWidget(this.task, this.function, this.deleteFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CheckboxListTile(
            value: task.isComplete,
            onChanged: (value) {
              this.function(task);
            },
            secondary: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                this.deleteFunction(task);
              },
            ),
            title: Text(task.title),
          ),
        ));
  }
}
