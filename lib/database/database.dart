import '../objectbox.g.dart';

class Database {
  Store? _store;

  Future<Store> getStore() async {
    return _store ??= await openStore();
  }
}
