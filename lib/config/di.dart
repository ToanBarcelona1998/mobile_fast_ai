import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_fast_ai/src/application/data/local/local_storage_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/auth/auth_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/upload/upload_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/user/user_service_impl.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_local_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/otp_code_verification/otp_code_verification_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/splash/splash_cubit.dart';
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

  getIt.registerLazySingleton<UploadServiceGenerator>(
    () => UploadServiceGenerator(
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

  getIt.registerLazySingleton<UploadService>(
    () => UploadServiceImpl(
      getIt.get<UploadServiceGenerator>(),
    ),
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

  getIt.registerLazySingleton<UploadRepository>(
    () => UploadRepositoryImpl(
      getIt.get<UploadService>(),
    ),
  );

  // Use case
  getIt.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      getIt.get<SecureLocalStorageRepository>(),
      getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<UserUseCase>(
    () => UserUseCase(
      getIt.get<UserRepository>(),
      getIt.get<SecureLocalStorageRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadUseCase>(
    () => UploadUseCase(
      getIt.get<UploadRepository>(),
      getIt.get<SecureLocalStorageRepository>(),
    ),
  );

  // Bloc
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(
      getIt.get<UserUseCase>(),
    ),
  );

  getIt.registerFactory<SignInWithPasswordBloc>(
    () => SignInWithPasswordBloc(
      getIt.get<AuthUseCase>(),
    ),
  );

  getIt.registerFactory<SignUpFormBloc>(
    () => SignUpFormBloc(
      getIt.get<AuthUseCase>(),
    ),
  );

  getIt.registerFactoryParam<OtpCodeVerificationBloc, String, dynamic>(
    (email, _) => OtpCodeVerificationBloc(
      getIt.get<AuthUseCase>(),
      email: email,
    ),
  );

  getIt.registerFactory<SignUpPersonalInfoBloc>(
    () => SignUpPersonalInfoBloc(
      getIt.get<AuthUseCase>(),
      getIt.get<UploadUseCase>(),
    ),
  );
}
