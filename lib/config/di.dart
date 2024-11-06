import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_fast_ai/src/application/data/service/auth/auth_service_impl.dart';
import 'fast_ai_config.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependency(FastAIConfig config) async {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(
        milliseconds: 60000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 60000,
      ),
      contentType: 'application/json; charset=utf-8',
    ),
  );

  getIt.registerLazySingleton<FastAIConfig>(() => config);

  getIt.registerFactory<Dio>(() => dio);

  // Client generator
  getIt.registerLazySingleton<AuthServiceGenerator>(
    () => AuthServiceGenerator(
      getIt.get<Dio>(),
    ),
  );

  // Service
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      getIt.get<AuthServiceGenerator>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt.get<AuthService>()),
  );
}
