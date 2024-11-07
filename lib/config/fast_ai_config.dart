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
    return FastAIConfig(
      baseUrl: json['base_url'],
    );
  }
}
