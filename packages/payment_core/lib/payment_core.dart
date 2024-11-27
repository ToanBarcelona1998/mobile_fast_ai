library payment_core;

import 'package:payment_core/src/core/provider/provider.dart';
import 'package:payment_core/src/payment_core_impl.dart';

import 'src/core/entity/entity.dart';

export 'src/core/entity/entity.dart';
export 'src/core/provider/provider.dart';

abstract class PaymentCore {
  static PaymentCore? _instance;

  static PaymentCore get instance => _instance!;

  static void create({
    required LocalPaymentStorage localPaymentStorage,
    required TransactionProvider transactionProvider,
  }) {
    _instance = PaymentCoreImpl(
      transactionProvider,
      localPaymentStorage,
    );
  }

  Future<void> process({
    required PaymentCoreRequest request,
  });
}
