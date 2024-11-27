import 'package:mobile_fast_ai/src/application/provider/payment_core/request/payment_core_request_dto.dart';
import 'package:mobile_fast_ai/src/application/provider/payment_core/transaction/transaction_service.dart';
import 'package:payment_core/payment_core.dart';

final class TransactionProviderI implements TransactionProvider {
  final Future<String> Function() accessTokenF;
  final TransactionServiceGenerator _transactionServiceGenerator;

  const TransactionProviderI(
    this.accessTokenF,
    this._transactionServiceGenerator,
  );

  @override
  Future<bool> completeTransaction({
    required CompleteTransactionRequest request,
  }) async {
    final String accessToken = await accessTokenF.call();

    final baseResponse = await _transactionServiceGenerator.completeTransaction(
      accessToken,
      request.toJson(),
    );

    final data = baseResponse.handleResponse();

    throw UnimplementedError();
  }

  @override
  Future<CoreTransaction> createTransaction({
    required CreateTransactionRequest request,
  }) async {
    final String accessToken = await accessTokenF.call();

    final baseResponse = await _transactionServiceGenerator.createTransaction(
      accessToken,
      request.toJson(),
    );

    final data = baseResponse.handleResponse();

    throw UnimplementedError();
  }
}
