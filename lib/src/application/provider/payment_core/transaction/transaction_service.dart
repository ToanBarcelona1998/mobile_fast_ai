import 'package:data/core/base_response.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'transaction_service.g.dart';

@RestApi()
abstract class TransactionServiceGenerator {
  factory TransactionServiceGenerator(Dio dio,{String ?baseUrl}) = _TransactionServiceGenerator;

  @POST(APIService.createTransaction)
  @MultiPart()
  Future<BaseResponse> createTransaction(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.completeTransaction)
  @MultiPart()
  Future<BaseResponse> completeTransaction(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );
}
