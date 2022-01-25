import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_ui/models/task.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper databaseHelper = DatabaseHelper._();
  Database database;
  initDatabase() {
    connectToDatabase();
  }

  connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + '/tasks.db';
    database = await openDatabase(databasePath, version: 1, onCreate: (db, v) {
      db.execute('''
      CREATE TABLE tasks 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isComplete INTEGER)
      ''');
    });
  }

  Future<List<Task>> getAllTasks() async {
    List<Map<String, Object>> data = await database.query('tasks');

    log(data.toString());
  }

  Future<Task> getOneTask(int id) async {
    List<Map<String, Object>> data =
        await database.query('tasks', where: 'id=?', whereArgs: [id]);
    Map<String, Object> task = data.first;
  }

  Future<int> insertNewTask(Task task) async {
    int rowCount = await database.insert('tasks', task.toMap());
    return rowCount;
  }

  updateOneTask(Task task) async {
    database.update('tasks', task.toMap(), where: 'id=?', whereArgs: [task.id]);
  }

  deleteOneTask(Task task) async {
    database.delete('tasks', where: 'id=?', whereArgs: [task.id]);
  }
}
