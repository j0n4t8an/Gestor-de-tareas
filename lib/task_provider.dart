import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = [];
  String? _username;

  List<Map<String, dynamic>> get tasks => _tasks;
  String? get username => _username;

  TaskProvider();

  void setUser(String username) {
    _username = username;
    _tasks = []; 
    notifyListeners();
  }

  void addTask(String name, String dueDate) {
    final task = {'name': name, 'due_date': dueDate};
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, String name, String dueDate) {
    _tasks[index] = {'name': name, 'due_date': dueDate};
    notifyListeners();
  }
}
