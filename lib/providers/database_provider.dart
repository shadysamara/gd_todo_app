import 'package:flutter/material.dart';
import 'package:todo_ui/data/database_helper.dart';
import 'package:todo_ui/models/task.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getAllTasks();
  }
  TextEditingController taskTitleController = TextEditingController();
  bool isComplete = false;
  changeIsCompleteOnNewTaskScreen() {
    isComplete = !isComplete;
    notifyListeners();
  }

  List<Task> allTasks = [];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];
  fillTasksLists(List<Task> tasks) {
    allTasks = tasks;
    completeTasks = tasks.where((element) => element.isComplete).toList();
    inCompleteTasks = tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertNewTask() async {
    Task task = Task(title: taskTitleController.text, isComplete: isComplete);
    await DatabaseHelper.databaseHelper.insertNewTask(task);
    getAllTasks();
  }

  getAllTasks() async {
    List<Task> allTasks = await DatabaseHelper.databaseHelper.getAllTasks();
    fillTasksLists(allTasks);
  }

  updateTask(Task task) async {
    task.isComplete = !task.isComplete;
    await DatabaseHelper.databaseHelper.updateOneTask(task);
    getAllTasks();
  }

  deleteTask(Task task) async {
    await DatabaseHelper.databaseHelper.deleteOneTask(task);
    getAllTasks();
  }
}
