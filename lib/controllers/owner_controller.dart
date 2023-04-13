import 'package:flutter/material.dart';
import 'package:teste_object_box/database/objectbox_database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/repositories/owner_repository.dart';

class OwnerController extends ChangeNotifier {
  late final ObjectBoxDatabase _database;

  late final OwnerRepository _ownerRepository = OwnerRepository(_database);

  OwnerController(this._database);

  Future<List<Owner>> all() async {
    return await _ownerRepository.all();
  }

  Future<List<Owner>> findByName(String name) async {
    return await _ownerRepository.findByName(name);
  }

  void add(String name) {
    _ownerRepository.add(name);
  }

  void update(Owner owner) {
    _ownerRepository.update(owner);
  }

  void remove(Owner owner) {
    _ownerRepository.remove(owner);
  }
}
