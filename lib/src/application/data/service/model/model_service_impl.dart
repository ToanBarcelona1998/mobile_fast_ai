import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'model_service_impl.g.dart';

final class ModelServiceImpl implements ModelService {
  final ModelServiceGenerator _modelServiceGenerator;

  const ModelServiceImpl(this._modelServiceGenerator);

  @override
  Future<BaseResponse> getAll({required String accessToken}) {
    return _modelServiceGenerator.getAll(accessToken);
  }
}

@RestApi()
abstract class ModelServiceGenerator {
  factory ModelServiceGenerator(
    Dio dio, {
    String? baseUrl,
  }) = _ModelServiceGenerator;

  @GET(APIService.getAllModel)
  Future<BaseResponse> getAll(
    @Header('Authorization') String accessToken,
  );
}
