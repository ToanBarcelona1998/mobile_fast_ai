import 'package:payment_core/src/core/entity/payment_request/payment_request.dart';
import 'package:payment_core/src/core/entity/type.dart';

final class PaymentCoreRequest {
  final int packageId;
  final int methodId;
  final PaymentType type;
  final PaymentRequest request;

  final void Function()? onStart;
  final void Function()? onCompleted;
  final void Function(Object error)? onError;

  const PaymentCoreRequest({
    required this.methodId,
    required this.packageId,
    required this.type,
    required this.request,
    this.onStart,
    this.onError,
    this.onCompleted,
  });
}
