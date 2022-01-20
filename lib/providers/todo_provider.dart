import 'package:flutter/material.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/router.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> allTasks = [];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];

  getAllLists() {
    completeTasks = allTasks.where((element) => element.isComplete).toList();
    inCompleteTasks = allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  TextEditingController taskTitleController = TextEditingController();
  bool taskIsComplete = false;
  changeIsCompleteOnNewTaskScreen() {
    this.taskIsComplete = !this.taskIsComplete;
    notifyListeners();
  }

  addNewTask() {
    Task task =
        Task(title: taskTitleController.text, isComplete: taskIsComplete);
    allTasks.add(task);
    getAllLists();
    taskTitleController.clear();
    taskIsComplete = false;
    RouterClass.routerClass.popFunction();
  }

  removeTask(Task task) {
    allTasks.remove(task);
    getAllLists();
  }

  updateTask(Task task) {
    int index = allTasks.indexOf(task);
    allTasks[index].isComplete = !allTasks[index].isComplete;
    getAllLists();
  }
}
