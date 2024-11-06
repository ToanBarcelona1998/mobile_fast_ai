enum FastAIEnvironment {
  dev,
  prod,
}

final class FastAIConfig {
  final String baseUrl;

  const FastAIConfig({
    required this.baseUrl,
  });
}
