import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/providers/todo_provider.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, providerInstance, x) {
      return ListView.builder(
          itemCount: providerInstance.allTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              providerInstance.allTasks[index],
            );
          });
    });
  }
}
