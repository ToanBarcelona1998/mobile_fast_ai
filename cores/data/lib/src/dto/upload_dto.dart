import 'package:domain/domain.dart';

extension UploadDtoMapper on UploadDto {
  Upload get toEntity => Upload(url: url);
}

final class UploadDto {
  final String url;

  const UploadDto({
    required this.url,
  });

  factory UploadDto.fromJson(Map<String, dynamic> json) {
    return UploadDto(
      url: json['url'],
    );
  }
}
