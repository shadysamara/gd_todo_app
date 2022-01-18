import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_ui/data/dummy_data.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/router.dart';
import 'package:todo_ui/ui/screens/all_tasks_screen.dart';
import 'package:todo_ui/ui/screens/complete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/inComplete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/new_task_screen.dart';

class TodoMainPage extends StatefulWidget {
  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage>
    with SingleTickerProviderStateMixin {
  updateAllScreens(Task task) {
    task.isComplete = !task.isComplete;
    setState(() {});
  }

  deleteTask(Task task) {
    allTasks.remove(task);
    setState(() {});
  }

  TabController tabController;
  initTabController() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      String message = tabController.index == 0
          ? 'you are in the all tasks tab'
          : tabController.index == 1
              ? 'you are in the completed tasks tab'
              : 'ypu are in the incomplete tasks tab';
      log(message);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(NewTaskScreen());
              },
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('O'),
                      ),
                      accountName: Text('Omar'),
                      accountEmail: Text('omar@gmail.com')),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(0);
                    },
                    title: Text('All Tasks'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(1);
                    },
                    title: Text('Complete Tasks'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(2);
                    },
                    title: Text('InComplete Tasks'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('TODO APP'),
              bottom: TabBar(
                controller: tabController,
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
            body: TabBarView(controller: tabController, children: [
              AllTasksScreen(updateAllScreens, deleteTask),
              CompleteTasksScreen(updateAllScreens, deleteTask),
              InCompleteTasksScreen(updateAllScreens, deleteTask),
            ]))
        : Scaffold(
            appBar: AppBar(
              title: Text('TODO APP'),
            ),
            body: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('O'),
                          ),
                          accountName: Text('Omar'),
                          accountEmail: Text('omar@gmail.com')),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(0);
                        },
                        title: Text('All Tasks'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(1);
                        },
                        title: Text('Complete Tasks'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(2);
                        },
                        title: Text('InComplete Tasks'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  AllTasksScreen(updateAllScreens, deleteTask),
                  CompleteTasksScreen(updateAllScreens, deleteTask),
                  InCompleteTasksScreen(updateAllScreens, deleteTask),
                ]))
              ],
            ),
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
