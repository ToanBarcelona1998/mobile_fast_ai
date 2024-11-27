import 'type.dart';

final class CoreTransaction {
  final int id;
  final PaymentType paymentType;
  final String status;
  final int methodId;
  final int packageId;
  final int creditsPurchased;

  const CoreTransaction({
    required this.id,
    required this.paymentType,
    required this.status,
    required this.methodId,
    required this.packageId,
    required this.creditsPurchased,
  });
}
