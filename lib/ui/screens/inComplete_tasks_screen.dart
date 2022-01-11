import 'package:flutter/material.dart';
import 'package:todo_ui/data/dummy_data.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  Function function;
  Function deleteFun;
  InCompleteTasksScreen(this.function, this.deleteFun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return allTasks.where((element) => !element.isComplete).length == 0
        ? Center(
            child: Text('Congratulations! you have completed all tasks'),
          )
        : ListView.builder(
            itemCount: allTasks.where((element) => !element.isComplete).length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  allTasks
                      .where((element) => !element.isComplete)
                      .toList()[index],
                  function,
                  deleteFun);
            });
  }
}
