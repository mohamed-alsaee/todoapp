import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  void addTask(TaskModel tm) {
    tasks.add(tm);
    saveToLocalStorage();
    notifyListeners();
  }

  void removeTask(TaskModel td) {
    tasks.remove(td);
    saveToLocalStorage();
    notifyListeners();
  }

  void switchIsDone(TaskModel t) {
    TaskModel tempTask = t;
    tasks.remove(t);
    tempTask.isDone = !tempTask.isDone;
    tasks.add(tempTask);
    saveToLocalStorage();
    notifyListeners();
  }

  void saveToLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<Map<String, dynamic>> jsonList = tasks
        .map((t) => t.toJson())
        .toList();

    final String encodedList = jsonEncode(jsonList);

    prefs.setString("json_tasks", encodedList);
    if (kDebugMode) {
      print("JSON LIST : $jsonList");
    }

    getFromLocalStorage();
  }

  Future<void> getFromLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedTasks = prefs.getString("json_tasks");

    if (storedTasks != null) {
      final List<dynamic> decodedList = jsonDecode(storedTasks);

      if (kDebugMode) {
        print("DECODED DATA : $decodedList");
      }

      tasks = decodedList.map((json) => TaskModel.fromJson(json)).toList();

      notifyListeners();
    }
  }
}
