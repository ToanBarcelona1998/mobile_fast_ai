import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_fast_ai/src/application/data/local/local_storage_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/auth/auth_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/image_generator/image_generator_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/model/model_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/upload/upload_service_impl.dart';
import 'package:mobile_fast_ai/src/application/data/service/user/user_service_impl.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_local_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/my_profile/my_profile_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/otp_code_verification/otp_code_verification_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/splash/splash_cubit.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_to_prompt_upload/image_to_prompt_upload_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/remove_background_upload/remove_background_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_bloc.dart';
import 'package:objectbox/objectbox.dart';
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
        milliseconds: 40000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 40000,
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

  getIt.registerLazySingleton<ImageGeneratorServiceGenerator>(
    () => ImageGeneratorServiceGenerator(
      getIt.get<Dio>(),
    ),
  );

  getIt.registerLazySingleton<ModelServiceGenerator>(
    () => ModelServiceGenerator(
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

  getIt.registerLazySingleton<ImageGeneratorService>(
    () => ImageGeneratorServiceImpl(
      getIt.get<ImageGeneratorServiceGenerator>(),
    ),
  );

  getIt.registerLazySingleton<ModelService>(
    () => ModelServiceImpl(
      getIt.get<ModelServiceGenerator>(),
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

  getIt.registerLazySingleton<ImageGeneratorRepository>(
    () => ImageGeneratorRepositoryImpl(
      getIt.get<ImageGeneratorService>(),
    ),
  );

  getIt.registerLazySingleton<ModelRepository>(
    () => ModelRepositoryImpl(
      getIt.get<ModelService>(),
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
      getIt.get<NormalLocalStorageRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadUseCase>(
    () => UploadUseCase(
      getIt.get<UploadRepository>(),
      getIt.get<SecureLocalStorageRepository>(),
    ),
  );

  getIt.registerLazySingleton<GeneratorUseCase>(
    () => GeneratorUseCase(
      getIt.get<ImageGeneratorRepository>(),
      getIt.get<SecureLocalStorageRepository>(),
    ),
  );

  getIt.registerLazySingleton<ModelUseCase>(
    () => ModelUseCase(
      getIt.get<ModelRepository>(),
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

  getIt.registerFactory<ImageGeneratorBloc>(
    () => ImageGeneratorBloc(
      getIt.get<GeneratorUseCase>(),
      getIt.get<ModelUseCase>(),
    ),
  );

  getIt.registerFactory<RemoveBackgroundUploadBloc>(
    () => RemoveBackgroundUploadBloc(
      getIt.get<GeneratorUseCase>(),
    ),
  );

  getIt.registerFactory<UpscaleImageUploadBloc>(
    () => UpscaleImageUploadBloc(
      getIt.get<GeneratorUseCase>(),
    ),
  );

  getIt.registerFactory<ImageToPromptUploadBloc>(
    () => ImageToPromptUploadBloc(
      getIt.get<GeneratorUseCase>(),
    ),
  );

  getIt.registerFactory<EnhancePromptInputBloc>(
    () => EnhancePromptInputBloc(
      getIt.get<GeneratorUseCase>(),
    ),
  );


  getIt.registerFactory<MyProfileBloc>(
    () => MyProfileBloc(
      getIt.get<UserUseCase>(),
    ),
  );
}
