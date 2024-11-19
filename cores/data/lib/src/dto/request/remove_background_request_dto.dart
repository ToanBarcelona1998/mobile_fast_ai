import 'package:domain/domain.dart';

extension RemoveBackgroundRequestDto on RemoveBackgroundRequest{
  Map<String,dynamic> toJson(){
    return {
      'image' : image,
    };
  }
}