import 'package:payment_core/src/core/entity/entity.dart';

import 'payment.dart';

final class Web3Payment implements IPayment<Web3PaymentRequest> {
  @override
  Future<void> request({
    required Web3PaymentRequest request,
  }) {
    // TODO: implement sendRequest
    throw UnimplementedError();
  }

  @override
  Future<String?> getVerifier() {
    // TODO: implement streamResult
    throw UnimplementedError();
  }
}
