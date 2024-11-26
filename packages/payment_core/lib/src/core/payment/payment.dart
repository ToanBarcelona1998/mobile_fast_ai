import 'package:payment_core/src/core/entity/entity.dart';

abstract interface class IPayment<R extends PaymentRequest> {
  Future<void> request({required R request});

  Future<String?> getVerifier();
}