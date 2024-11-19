import 'package:domain/domain.dart';

extension ControlNetRequestDto on ControlNetRequest {
  Map<String, dynamic> toJson() {
    return {
      'input_image': image,
      'type': type,
      'width': width,
      'height': height,
    };
  }
}
