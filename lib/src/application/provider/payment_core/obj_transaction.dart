import 'package:domain/domain.dart';
import 'package:mobile_fast_ai/src/cores/utils/payment_core.dart';
import 'package:objectbox/objectbox.dart';
import 'package:payment_core/payment_core.dart' hide PaymentType;

extension OTransactionMapper on OTransaction {
  CoreTransaction get toCoreTx => CoreTransaction(
        id: id,
        paymentType: type.toPaymentCoreType,
        status: status,
        methodId: methodId,
        packageId: packageId,
        creditsPurchased: creditsPurchased,
      );
}

extension CoreTransactionMapper on CoreTransaction {
  OTransaction get toOTx => OTransaction(
        id: id,
        type: paymentType.toPaymentType,
        status: status,
        methodId: methodId,
        packageId: packageId,
        creditsPurchased: creditsPurchased,
      );
}

@Entity()
final class OTransaction {
  @Id(assignable: true)
  final int id;
  final PaymentType type;
  final String status;
  final int methodId;
  final int packageId;
  final int creditsPurchased;

  const OTransaction({
    required this.id,
    required this.type,
    required this.status,
    required this.methodId,
    required this.packageId,
    required this.creditsPurchased,
  });
}
