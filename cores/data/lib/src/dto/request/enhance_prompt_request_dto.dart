import 'package:domain/domain.dart';

extension EnhancePromptRequestDto on EnhancePromptRequest{
  Map<String,dynamic> toJson(){
    return {
      'prompt' : prompt,
      'prompt_max_length' : maxLength,
    };
  }
}