import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/providers/todo_provider.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, nada, x) {
      return nada.inCompleteTasks.length == 0
          ? Center(
              child: Lottie.asset('assets/animations/empty.json'),
            )
          : ListView.builder(
              itemCount: nada.inCompleteTasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  nada.inCompleteTasks.toList()[index],
                );
              });
    });
  }
}
