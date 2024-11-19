abstract interface class LocalPaymentStorage{
  Future<void> add();

  Future<void> delete(int id);

  Future<void> deleteAll();

  Future<void> getAll();

  Future<void> get(int id);
}