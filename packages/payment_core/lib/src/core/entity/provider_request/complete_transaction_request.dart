import 'package:payment_core/src/core/entity/type.dart';

final class CompleteTransactionRequest {
  final int txId;
  final PaymentType type;
  final String verifyData;

  const CompleteTransactionRequest({
    required this.txId,
    required this.verifyData,
    required this.type,
  });
}
