import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/providers/todo_provider.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, ahmed, x) {
      return ahmed.completeTasks.length == 0
          ? Center(
              child: Lottie.asset('assets/animations/empty.json'),
            )
          : ListView.builder(
              itemCount: ahmed.completeTasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  ahmed.completeTasks.toList()[index],
                );
              });
    });
  }
}
