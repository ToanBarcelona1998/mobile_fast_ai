enum PaymentType{
  web3,
  google,
  apple
}

final class PaymentProvider {
  final int id;
  final String name;
  final PaymentType type;
  final String? description;

  const PaymentProvider({
    required this.id,
    required this.name,
    required this.type,
    this.description,
  });
}
