import 'package:teste_object_box/database/database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/models/task.dart';
import '../objectbox.g.dart';

class TaskRepository {
  List<Task> _tasks = [];
  late final Task _task;

  late final Database _database;

  TaskRepository(this._database);

  Future<Box> _getBox() async {
    final store = await _database.getStore();

    return store.box<Task>();
  }

  List<Task> get tasks => _tasks;

  Task get task => _task;

  add(String text, Owner owner) async {
    final taskNew = Task(text);

    taskNew.owner.target = owner;

    final box = await _getBox();

    box.put(taskNew);

    _task = taskNew;
  }

  update(Task task) async {
    final box = await _getBox();

    box.put(task);

    _task = task;
  }

  Future<void> remove(Task task) async {
    final box = await _getBox();

    box.remove(task.id);
  }

  all() async {
    final box = await _getBox();

    _tasks = box.getAll() as List<Task>;
  }

  allDone() async {
    final box = await _getBox();

    final query = box.query(Task_.status.equals(false)).build();

    _tasks = query.find() as List<Task>;

    query.close();
  }
}
