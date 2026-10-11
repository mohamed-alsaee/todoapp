import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(title: "title", createdAt: DateTime.now()),
  ];

  void addTask(TaskModel tm) {
    tasks.add(tm);
    notifyListeners();
  }

  void removeTask(TaskModel td) {
    tasks.remove(td);
    notifyListeners();
  }

  void switchIsDone(TaskModel t) {
    TaskModel tempTask = t;
    tasks.remove(t);
    tempTask.isDone = !tempTask.isDone;
    tasks.add(tempTask);
    notifyListeners();
  }

  void saveToLocalStorage() {
    // TODO Complete the function with SharedPrefrences
  }

  void getFromLocalStorage() {
    // TODO Complete the function with SharedPrefrences
  }
}
