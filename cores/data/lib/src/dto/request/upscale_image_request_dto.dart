import 'package:domain/domain.dart';

extension UpscaleImageRequestDto on UpScaleImageRequest{
  Map<String,dynamic> toJson(){
    return {
      'scaleFactor' : scaleFactor,
    };
  }
}