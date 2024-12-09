import 'package:objectbox/objectbox.dart';
import 'package:payment_core/payment_core.dart' hide PaymentType;

extension OTransactionMapper on OTransaction {
  CoreTransaction get toCoreTx => CoreTransaction(
        id: id,
        status: status,
        methodId: methodId,
        packageId: packageId,
        creditsPurchased: creditsPurchased,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension CoreTransactionMapper on CoreTransaction {
  OTransaction get toOTx => OTransaction(
        id: id,
        status: status,
        methodId: methodId,
        packageId: packageId,
        creditsPurchased: creditsPurchased,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@Entity()
final class OTransaction {
  @Id(assignable: true)
  final int id;
  final String status;
  final int methodId;
  final int packageId;
  final int creditsPurchased;
  final String createdAt;
  final String? updatedAt;

  const OTransaction({
    required this.id,
    required this.status,
    required this.methodId,
    required this.packageId,
    required this.creditsPurchased,
    required this.createdAt,
    this.updatedAt,
  });

  factory OTransaction.fromJson(Map<String, dynamic> json) {
    return OTransaction(
        id: json['id'],
        status: json['status'],
        methodId: json['methodId'],
        packageId: json['packageId'],
        creditsPurchased: json['creditsPurchased'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
