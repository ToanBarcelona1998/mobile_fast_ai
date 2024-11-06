enum PurchaseStatus {
  pending,
  completed,
  failed,
}

final class Purchase {
  final int id;
  final int methodId;
  final int packageId;
  final int creditsPurchased;
  final PurchaseStatus status;
  final String createdAt;
  final String? updatedAt;

  const Purchase({
    required this.id,
    required this.methodId,
    required this.packageId,
    required this.creditsPurchased,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });
}
