abstract interface class TransactionProvider{
  Future<void> createTransaction();

  Future<void> completeTransaction();
}