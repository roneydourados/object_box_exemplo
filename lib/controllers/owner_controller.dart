import 'package:flutter/material.dart';
import 'package:teste_object_box/database/database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/repositories/owner_repository.dart';

class OwnerController extends ChangeNotifier {
  late final Database _database;

  late final OwnerRepository _ownerRepository = OwnerRepository(_database);

  OwnerController(this._database);

  Future<List<Owner>> all() async {
    return await _ownerRepository.all();
  }

  Future<List<Owner>> findByName(String name) async {
    return await _ownerRepository.findByName(name);
  }

  Future<Owner> add(String name) async {
    return await _ownerRepository.add(name);
  }

  Future<Owner> update(Owner owner) async {
    return await _ownerRepository.update(owner);
  }

  Future<void> remove(Owner owner) async {
    await _ownerRepository.remove(owner);
  }
}
