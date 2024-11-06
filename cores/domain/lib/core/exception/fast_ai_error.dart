final class FastAIError{
  final int code;
  final String? message;

  const FastAIError({
    required this.code,
    this.message,
  });

  @override
  String toString() {
    return '[$code]: ${message ?? ''}';
  }
}