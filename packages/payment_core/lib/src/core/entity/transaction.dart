import 'package:payment_core/src/core/type.dart';

final class CoreTransaction {
  final int id;
  final PaymentType paymentType;

  const CoreTransaction({
    required this.id,
    required this.paymentType,
  });
}
