import 'package:teste_object_box/database/objectbox_database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/models/task.dart';
import '../objectbox.g.dart';

class TaskReposotiry {
  List<Task> _tasks = [];

  late final Box<Task> taskBox;
  late final ObjectBoxDatabase _database;

  TaskReposotiry(this._database);

  Future<Box> getBox() async {
    final store = await _database.getStore();
    return store!.box<Task>();
  }

  List<Task> get tasks => _tasks;

  void add(String text, Owner owner) async {
    final task = Task(text);
    task.owner.target = owner;

    final box = await getBox();

    box.put(task);
  }

  void update(Task task) async {
    final box = await getBox();

    box.put(task);
  }

  void remove(Task task) async {
    final box = await getBox();

    box.remove(task.id);
  }

  void all() async {
    final box = await getBox();
    _tasks = box.getAll() as List<Task>;
  }

  void allDone() async {
    final box = await getBox();

    final query = box.query(Task_.status.equals(false)).build();

    _tasks = query.find() as List<Task>;

    query.close();
  }
}
