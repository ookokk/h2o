import 'package:h2o_flutter/src/product/model/user.dart';
import 'package:hive_flutter/adapters.dart';

class CacheManager {
  static const String _userBoxName = 'userBox';

  Box<User>? _userBox;

  CacheManager._privateConstructor();

  static final CacheManager instance = CacheManager._privateConstructor();

  Future<void> init() async {
    await Hive.initFlutter();

    _userBox = await Hive.openBox<User>(_userBoxName);
  }

  Future<void> saveUser(User user) async {
    await _userBox?.put('user', user);
  }

  User? getUser() {
    return _userBox?.get('user');
  }

  Future<void> deleteUser() async {
    await _userBox?.delete('user');
  }
}
