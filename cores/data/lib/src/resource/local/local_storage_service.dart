abstract interface class LocalStorageService{
  Future<String?> get(String key);

  Future<bool> add(String key,String value);

  Future<void> delete(String key);

  Future<bool> update(String key,String value);
}

abstract interface class NormalLocalStorageService implements LocalStorageService{

}

abstract interface class SecureLocalStorageService implements LocalStorageService{

}