import '../objectbox.g.dart';

class ObjectBoxDatabase {
  Store? _store;

  ObjectBoxDatabase();

  Future<Store?> getStore() async {
    if (_store == null) {
      _store = await openStore();
      return _store;
    } else {
      return _store;
    }
  }
}
