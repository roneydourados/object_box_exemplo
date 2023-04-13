import 'package:flutter/material.dart';
import 'package:teste_object_box/database/objectbox_database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/models/task.dart';
import 'package:teste_object_box/repositories/task_repository.dart';

class TaskController extends ChangeNotifier {
  late final ObjectBoxDatabase _database;

  late final TaskRepository _taskReposotiry = TaskRepository(_database);

  TaskController(this._database);

  Future<Task> add(String text, Owner owner) async {
    return await _taskReposotiry.add(text, owner);
  }

  Future<Task> update(Task task) async {
    return await _taskReposotiry.update(task);
  }

  Future<void> delete(Task task) async {
    await _taskReposotiry.remove(task);
  }

  Future<List<Task>> all() async {
    return await _taskReposotiry.all();
  }

  Future<List<Task>> allDone() async {
    return await _taskReposotiry.allDone();
  }
}
