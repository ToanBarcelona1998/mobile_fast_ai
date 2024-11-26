import 'package:payment_core/payment_core.dart';
import 'package:payment_core/src/core/payment/apple_payment.dart';
import 'package:payment_core/src/core/payment/google_payment.dart';
import 'package:payment_core/src/core/payment/payment.dart';
import 'package:payment_core/src/core/payment/web3_payment.dart';
import 'package:payment_core/src/core/provider/provider.dart';

import 'core/entity/entity.dart';

final class PaymentCoreImpl implements PaymentCore{
  final TransactionProvider _transactionProvider;
  final LocalPaymentStorage _localPaymentStorage;

  PaymentCoreImpl(
    this._transactionProvider,
    this._localPaymentStorage,
  );

  final IPayment _applePayment = ApplePayment();
  final IPayment _googlePayment = GooglePayment();
  final IPayment _web3Payment = Web3Payment();

  @override
  Future<void> process({
    required PaymentCoreRequest request,
  }) async {
    try {
      request.onStart?.call();

      final CreateTransactionRequest createTxRequest = CreateTransactionRequest(
        packageId: request.packageId,
        methodId: request.methodId,
      );

      // Create transaction
      final transaction = await _transactionProvider.createTransaction(
        request: createTxRequest,
      );

      // Save transaction to local storage
      await _localPaymentStorage.add(
        tx: transaction,
      );

      final IPayment payment = _paymentByType(
        request.type,
      );

      await payment.request(
        request: request.request,
      );

      final String? verifier = await payment.getVerifier();

      if (verifier == null) {
        await _localPaymentStorage.delete(transaction.id);
        request.onError?.call('Transaction did not complete');
      } else {
        final CompleteTransactionRequest completeTransactionRequest =
        CompleteTransactionRequest(
          txId: transaction.id,
          verifyData: verifier,
          type: request.type,
        );

        await _transactionProvider.completeTransaction(
          request: completeTransactionRequest,
        );

        await _localPaymentStorage.delete(transaction.id);

        request.onCompleted?.call();
      }
    } catch (e) {
      request.onError?.call(e);
    }
  }

  Future<void> verifyClientTxs()async{

  }

  IPayment _paymentByType(PaymentType type) {
    switch (type) {
      case PaymentType.google:
        return _googlePayment;
      case PaymentType.apple:
        return _applePayment;
      case PaymentType.web3:
        return _web3Payment;
    }
  }
}
