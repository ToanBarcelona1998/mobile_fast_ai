final class Model {
  final int id;
  final String model;
  final String tags;
  final String thumbnail;
  final String? detail;

  const Model({
    required this.id,
    required this.model,
    required this.tags,
    required this.thumbnail,
    this.detail,
  });
}
