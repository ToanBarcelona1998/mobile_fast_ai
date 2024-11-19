import 'base_remote_request.dart';

final class EnhancePromptRequest extends BaseRemoteRequest {
  final String prompt;
  final int? maxLength;

  const EnhancePromptRequest({
    required this.prompt,
    required super.accessToken,
    this.maxLength,
  });

  bool validate(){
    return maxLength == null || (maxLength ?? 0) <= 64;
  }
}
