import 'package:flutter/material.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/ui/screens/all_tasks_screen.dart';
import 'package:todo_ui/ui/screens/complete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/inComplete_tasks_screen.dart';

class TodoMainPage extends StatefulWidget {
  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  updateAllScreens(Task task) {
    task.isComplete = !task.isComplete;
    setState(() {});
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newindex) {
          setState(() {
            this.index = newindex;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'All', icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: 'Complete', icon: Icon(Icons.done)),
          BottomNavigationBarItem(
              label: 'InComplete', icon: Icon(Icons.cancel)),
        ],
      ),
      body: index == 0
          ? AllTasksScreen(updateAllScreens)
          : index == 1
              ? CompleteTasksScreen(updateAllScreens)
              : InCompleteTasksScreen(updateAllScreens),
    );
  }
}
