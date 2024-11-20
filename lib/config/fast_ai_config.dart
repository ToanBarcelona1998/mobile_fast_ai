import 'dart:io';

enum FastAIEnvironment {
  dev,
  prod,
}

final class FastAIConfig {
  final String baseUrl;

  const FastAIConfig({
    required this.baseUrl,
  });

  factory FastAIConfig.fromJson(Map<String, dynamic> json) {
    final String baseUrl = Platform.isIOS ? json['base_url_ios'] : json['base_url'];
    return FastAIConfig(
      baseUrl: baseUrl,
    );
  }
}
