import 'package:domain/domain.dart';

extension ImageToTextRequestDto on ImageToTextRequest{
  Map<String,dynamic> toJson(){
    return {
      'input_image' : image,
    };
  }
}