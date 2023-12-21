import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class IsarService<T> {
  Isar _isar = GetIt.instance.get<Isar>();

  IsarService();

  Future<void> save(IsarLink<T> value) async {
    await _isar.writeTxn(() async {
      await value.save();
    });
  }

  Future<void> put(T value) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(value);
    });
  }

  Future<void> deleteAndPut(T value, int id) async {
    await deleteSingle(id);
    await put(value);
  }

  Future<void> saveAll(List<T> values) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().putAll(values);
    });
  }

  Future<void> clearCollection() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }

  Future<void> writeTransaction(Future Function() callback) async {
    await _isar.writeTxn(() async {
      await callback.call();
    });
  }

  Future<List<T>> findAll() async {
    final values = await _isar.collection<T>().where().findAll();
    return values;
  }

  IsarCollection<T> query() {
    return _isar.collection<T>();
  }

  Future<T?> findFirst() async {
    final value = await _isar.collection<T>().where().findFirst();
    return value;
  }

  Future<void> deleteSingle(int id) async {
    await _isar.writeTxn(() => _isar.collection<T>().delete(id));
  }
}
