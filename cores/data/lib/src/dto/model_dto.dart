import 'package:domain/domain.dart';

extension ModelDtoMapper on ModelDto {
  Model get toEntity => Model(
        id: id,
        model: model,
        tags: tags,
        thumbnail: thumbnail,
        detail: detail,
      );
}

final class ModelDto {
  final int id;
  final String model;
  final String tags;
  final String thumbnail;
  final String? detail;

  const ModelDto({
    required this.id,
    required this.model,
    required this.tags,
    required this.thumbnail,
    this.detail,
  });

  factory ModelDto.fromJson(Map<String, dynamic> json) {
    return ModelDto(
      id: json['id'],
      model: json['model'],
      tags: json['tags'],
      thumbnail: json['thumbnail'],
      detail: json['detail'],
    );
  }
}
