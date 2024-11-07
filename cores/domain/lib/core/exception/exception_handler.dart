import 'package:domain/core/exception/fast_ai_error.dart';

import 'base_exception_handle.dart';

abstract class ErrorHandler with BaseException{

  static late ErrorHandler _instance;

  static bool _isInitialized = false;

  static void setInstance(ErrorHandler errorHandle){
    _instance = errorHandle;

    _isInitialized = true;
  }

  static ErrorHandler getInstance(){
    if(_isInitialized){
      return _instance;
    }

    throw 'ErrorHandler has to set instance before to be used';
  }

  Future<T> call<T>({
    required Future<T> request,
  }) async {
    try {
      return await request;
    } catch (e) {
      observersError(e);

      if (e is FastAIError){
        if(errorMapperHandler(e) !=null){
          throw errorMapperHandler(e)!;
        }
        rethrow;
      }

      final appError = handleError(e);

      if(errorMapperHandler(appError) !=null){
        throw errorMapperHandler(appError)!;
      }

      throw appError;
    }
  }

  Future<T?> callNonObserver<T>({
    required Future<T> request,
  }) async {
    try {
      return await request;
    } catch (e) {
      if (e is FastAIError){
        if(errorMapperHandler(e) !=null){
          throw errorMapperHandler(e)!;
        }

        rethrow;
      }

      final appError = handleError(e);

      if(errorMapperHandler(appError) !=null){
        throw errorMapperHandler(appError)!;
      }

      throw appError;
    }
  }
}