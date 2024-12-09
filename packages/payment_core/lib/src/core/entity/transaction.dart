final class CoreTransaction {
  final int id;
  final String status;
  final int methodId;
  final int packageId;
  final int creditsPurchased;
  final String createdAt;
  final String ?updatedAt;

  const CoreTransaction({
    required this.id,
    required this.status,
    required this.methodId,
    required this.packageId,
    required this.creditsPurchased,
    required this.createdAt,
    this.updatedAt,
  });
}
