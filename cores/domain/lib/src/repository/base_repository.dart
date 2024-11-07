abstract interface class AddRepository<T,R>{
  Future<T> add({required R request});
}

abstract interface class UpdateRepository<R>{
  Future<bool> update({required R request});
}

abstract interface class DeleteRepository<ID>{
  Future<void> delete({required ID id});
}

abstract interface class DeleteAllRepository{
  Future<void> deleteAll();
}

abstract interface class GetRepository<T,ID>{
  Future<T?> get({required ID id});
}

abstract interface class GetAllRepository<T>{
  Future<List<T>> getAll();
}

abstract interface class GetAllWithParamRepository<T,P>{
  Future<List<T>> getAll({required P parameter});
}