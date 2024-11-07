import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_fast_ai/src/application/data/local/local_storage_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/auth/auth_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/user/user_service_impl.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_local_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fast_ai_config.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependency(FastAIConfig config) async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: AppLocalConstant.secureStorageName,
      preferencesKeyPrefix: AppLocalConstant.secureStoragePrefix,
    ),
    iOptions: IOSOptions(),
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

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

  getIt.registerLazySingleton<UserServiceGenerator>(
    () => UserServiceGenerator(
      getIt.get<Dio>(),
    ),
  );

  // Service
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      getIt.get<AuthServiceGenerator>(),
    ),
  );

  getIt.registerLazySingleton<UserService>(
    () => UserServiceImpl(
      getIt.get<UserServiceGenerator>(),
    ),
  );

  getIt.registerLazySingleton<NormalLocalStorageService>(
    () => NormalLocalStorageServiceImpl(sharedPreferences),
  );

  getIt.registerLazySingleton<SecureLocalStorageService>(
    () => const SecureLocalStorageServiceImpl(secureStorage),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt.get<AuthService>()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt.get<UserService>()),
  );

  getIt.registerLazySingleton<NormalLocalStorageRepository>(
    () => NormalLocalStorageRepositoryImpl(
      getIt.get<NormalLocalStorageService>(),
    ),
  );

  getIt.registerLazySingleton<SecureLocalStorageRepository>(
        () => SecureLocalStorageRepositoryImpl(
      getIt.get<SecureLocalStorageService>(),
    ),
  );
}
