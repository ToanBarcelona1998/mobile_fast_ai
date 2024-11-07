import 'package:dio/dio.dart';
import 'package:domain/core/core.dart';

final class ErrorHandlerImpl extends ErrorHandler{

  ErrorHandlerImpl();

  @override
  Object? errorMapperHandler(FastAIError error) {
    return null;
  }

  @override
  FastAIError handleError(Object e) {
    throw e;
  }


}