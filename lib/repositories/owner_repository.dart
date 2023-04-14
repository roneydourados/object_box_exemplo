import 'package:teste_object_box/database/database.dart';
import 'package:teste_object_box/models/owner.dart';
import '../objectbox.g.dart';

class OwnerRepository {
  List<Owner> _owners = [];

  late final Database _database;

  OwnerRepository(this._database);

  Future<Box> _getBox() async {
    final store = await _database.getStore();

    return store.box<Owner>();
  }

  List<Owner> get owners => _owners;

  add(String name) async {
    final owner = Owner(name);

    final box = await _getBox();

    final resId = box.put(owner);

    owner.id = resId;

    _owners.add(owner);
  }

  update(Owner owner) async {
    final box = await _getBox();

    box.put(owner);

    _owners.add(owner);
  }

  remove(Owner owner) async {
    final box = await _getBox();

    box.remove(owner.id);

    _owners.remove(owner);
  }

  Future<void> all() async {
    final box = await _getBox();

    _owners = box.getAll() as List<Owner>;
  }

  findByName(String name) async {
    final box = await _getBox();

    final query = box.query(Owner_.name.contains(name)).build();

    _owners = query.find() as List<Owner>;

    query.close();
  }
}
