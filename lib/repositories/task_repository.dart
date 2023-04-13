import 'package:teste_object_box/database/objectbox_database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/models/task.dart';
import '../objectbox.g.dart';

class TaskRepository {
  List<Task> _tasks = [];

  late final Box<Task> taskBox;
  late final ObjectBoxDatabase _database;

  TaskRepository(this._database);

  Future<Box> _getBox() async {
    final store = await _database.getStore();

    return store.box<Task>();
  }

  List<Task> get tasks => _tasks;

  Future<Task> add(String text, Owner owner) async {
    final task = Task(text);

    task.owner.target = owner;

    final box = await _getBox();

    box.put(task);

    return task;
  }

  Future<Task> update(Task task) async {
    final box = await _getBox();

    box.put(task);

    return task;
  }

  Future<void> remove(Task task) async {
    final box = await _getBox();

    box.remove(task.id);
  }

  Future<List<Task>> all() async {
    final box = await _getBox();

    _tasks = box.getAll() as List<Task>;

    return _tasks;
  }

  Future<List<Task>> allDone() async {
    final box = await _getBox();

    final query = box.query(Task_.status.equals(false)).build();

    _tasks = query.find() as List<Task>;

    query.close();

    return _tasks;
  }
}
