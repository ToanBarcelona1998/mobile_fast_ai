import 'package:data/core/base_response.dart';

abstract interface class ModelService {
  Future<BaseResponse> getAll({
    required String accessToken,
  });
}
