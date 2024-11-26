final class CreateTransactionRequest {
  final int methodId;
  final int packageId;

  const CreateTransactionRequest({
    required this.packageId,
    required this.methodId,
  });
}
