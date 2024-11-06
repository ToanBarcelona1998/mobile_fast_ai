final class Package {
  final int id;
  final String name;
  final int credits;
  final String description;
  final double price;
  final double? promoPrice;
  final String? promoEndTime;

  const Package({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.credits,
    this.promoEndTime,
    this.promoPrice,
  });
}
