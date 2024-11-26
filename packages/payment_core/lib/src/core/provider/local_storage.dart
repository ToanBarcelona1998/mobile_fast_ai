import 'package:payment_core/src/core/entity/transaction.dart';

abstract interface class LocalPaymentStorage {
  Future<void> add({
    required CoreTransaction tx,
  });

  Future<void> delete(int id);

  Future<void> deleteAll();

  Future<List<CoreTransaction>> getAll();

  Future<CoreTransaction?> get(int id);
}
