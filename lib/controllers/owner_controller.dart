import 'package:flutter/material.dart';
import 'package:teste_object_box/database/database.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:teste_object_box/repositories/owner_repository.dart';

class OwnerController extends ChangeNotifier {
  late final Database _database;

  List<Owner> _owners = [];

  late final OwnerRepository _ownerRepository = OwnerRepository(_database);

  OwnerController(this._database);

  List<Owner> get owners => _owners;

  all() async {
    await _ownerRepository.all();
    _owners = _ownerRepository.owners;
    notifyListeners();
  }

  findByName(String name) {
    _ownerRepository.findByName(name);
    _owners = _ownerRepository.owners;
  }

  add(String name) {
    _ownerRepository.add(name);
    _owners = _ownerRepository.owners;
  }

  update(Owner owner) {
    _ownerRepository.update(owner);
    _owners = _ownerRepository.owners;
  }

  remove(Owner owner) {
    _ownerRepository.remove(owner);
  }
}
