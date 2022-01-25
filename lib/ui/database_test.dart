import 'package:flutter/material.dart';
import 'package:todo_ui/data/database_helper.dart';
import 'package:todo_ui/models/task.dart';

class DatabaseScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            child: Text(''),
            onPressed: () {
              Task task = Task(
                  id: 1,
                  title: 'Mobile devloping course using Flutter',
                  isComplete: false);
              DatabaseHelper.databaseHelper.insertNewTask(task);
              // DatabaseHelper.databaseHelper.updateOneTask(task);
              // DatabaseHelper.databaseHelper.deleteOneTask(task);
            },
          ),
          RaisedButton(
            child: Text('get all tasks'),
            onPressed: () {
              DatabaseHelper.databaseHelper.getAllTasks();
            },
          ),
        ],
      ),
    );
  }
}
