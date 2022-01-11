import 'package:flutter/material.dart';
import 'package:todo_ui/data/dummy_data.dart';
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

  deleteTask(Task task) {
    allTasks.remove(task);
    setState(() {});
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('TODO APP'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.done),
                ),
                Tab(
                  icon: Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: index,
          //   onTap: (newindex) {
          //     setState(() {
          //       this.index = newindex;
          //     });
          //   },
          //   items: [
          //     BottomNavigationBarItem(label: 'All', icon: Icon(Icons.list)),
          //     BottomNavigationBarItem(label: 'Complete', icon: Icon(Icons.done)),
          //     BottomNavigationBarItem(
          //         label: 'InComplete', icon: Icon(Icons.cancel)),
          //   ],
          // ),
          body: TabBarView(children: [
            AllTasksScreen(updateAllScreens, deleteTask),
            CompleteTasksScreen(updateAllScreens, deleteTask),
            InCompleteTasksScreen(updateAllScreens, deleteTask),
          ])),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('SHADY'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return AppBar().preferredSize;
  }
}
