import 'package:data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class NormalLocalStorageServiceImpl implements NormalLocalStorageService{
  final SharedPreferences _storage;
  
  const NormalLocalStorageServiceImpl(this._storage);
  
  @override
  Future<bool> add(String key, String value) {
    return _storage.setString(key, value);
  }

  @override
  Future<void> delete(String key) {
    return _storage.remove(key);
  }

  @override
  Future<String?> get(String key) async{
    return _storage.getString(key);
  }

  @override
  Future<bool> update(String key, String value) {
    return add(key, value);
  }
  
}

final class SecureLocalStorageServiceImpl implements SecureLocalStorageService{
  final FlutterSecureStorage _storage;

  const SecureLocalStorageServiceImpl(this._storage);

  @override
  Future<bool> add(String key, String value) async{
    await _storage.write(key: key, value: value);

    return true;
  }

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<String?> get(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<bool> update(String key, String value) {
    return add(key, value);
  }
  
}