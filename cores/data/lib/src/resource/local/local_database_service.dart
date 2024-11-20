abstract interface class LocalDatabaseServiceAdd<R>{
  Future<void> add(R request);
}

abstract interface class LocalDatabaseServiceAddList<R>{
  Future<void> addList(List<R> request);
}

abstract interface class LocalDatabaseServiceDelete<ID>{
  Future<void> delete(ID id);
}

abstract interface class LocalDatabaseServiceDeleteAll{
  Future<void> deleteAll();
}

abstract interface class LocalDatabaseServiceGet<T,ID>{
  Future<T?> get(ID id);
}

abstract interface class LocalDatabaseServiceGetAll<T>{
  Future<List<T>> getAll();
}