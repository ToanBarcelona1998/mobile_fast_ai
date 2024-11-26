import 'package:payment_core/src/core/entity/provider_request/provider_request.dart';
import 'package:payment_core/src/core/entity/transaction.dart';

abstract interface class TransactionProvider {
  Future<CoreTransaction> createTransaction({
    required CreateTransactionRequest request,
  });

  Future<bool> completeTransaction({
    required CompleteTransactionRequest request,
  });
}
