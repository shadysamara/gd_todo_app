import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_ui/data/dummy_data.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/router.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String taskTitle;

  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (String value) {
                this.taskTitle = value;
              },
              decoration: InputDecoration(
                  label: Text('Task title'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            CheckboxListTile(
              value: isComplete,
              onChanged: (value) {
                this.isComplete = value;
                setState(() {});
              },
              title: Text('I have complete this task'),
            ),
            InkWell(
              onTap: () {
                if (this.taskTitle == null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('ok'))
                          ],
                          content: Text('Task titke cant be empty'),
                        );
                      });
                } else {
                  Iterable<Task> taskIsExist = allTasks
                      .where((element) => element.title == this.taskTitle);

                  if (taskIsExist.length == 0) {
                    Task task = Task(
                        isComplete: this.isComplete, title: this.taskTitle);
                    allTasks.add(task);
                    RouterClass.routerClass.popFunction();
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ok'))
                            ],
                            content:
                                Text('You have to enter unique task title'),
                          );
                        });
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Add The Task',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
