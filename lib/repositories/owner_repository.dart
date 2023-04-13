import 'package:flutter/material.dart';
import 'package:teste_object_box/database/objectbox_database.dart';
import 'package:teste_object_box/models/owner.dart';
import '../objectbox.g.dart';

class OwnerRepository extends ChangeNotifier {
  List<Owner> _owners = [];

  late final ObjectBoxDatabase _database;

  OwnerRepository(this._database);

  Future<Box> _getBox() async {
    final store = await _database.getStore();

    return store.box<Owner>();
  }

  List<Owner> get owners => _owners;

  Future<Owner> add(String name) async {
    final owner = Owner(name);

    final box = await _getBox();

    final resId = box.put(owner);

    owner.id = resId;

    return owner;
  }

  Future<Owner> update(Owner owner) async {
    final box = await _getBox();

    box.put(owner);

    return owner;
  }

  Future<void> remove(Owner owner) async {
    final box = await _getBox();

    box.remove(owner.id);
  }

  Future<List<Owner>> all() async {
    final box = await _getBox();

    _owners = box.getAll() as List<Owner>;

    return _owners;
  }

  Future<List<Owner>> findByName(String name) async {
    final box = await _getBox();

    final query = box.query(Owner_.name.contains(name)).build();

    _owners = query.find() as List<Owner>;

    query.close();

    return _owners;
  }
}
