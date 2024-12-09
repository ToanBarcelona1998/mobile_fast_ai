import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:mobile_fast_ai/config/di.dart' as di;
import 'package:mobile_fast_ai/config/fast_ai_config.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/error_handle_impl.dart';
import 'package:mobile_fast_ai/src/presentation/fast_ai_application.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'objectbox.g.dart';

import 'src/cores/constants/asset_path.dart';

import 'dart:developer' as developer;

// Change this one if you want to change environment
const FastAIEnvironment environment = FastAIEnvironment.dev;

Future<Map<String, dynamic>> _loadConfig() async {
  String loader;
  String path;

  switch (environment) {
    case FastAIEnvironment.dev:
      path = AssetConfigPath.configDev;
      break;
    case FastAIEnvironment.prod:
      path = AssetConfigPath.configProd;
  }
  try {
    loader = await rootBundle.loadString(
      path,
    );
  } catch (e) {
    loader = '';
    LogProvider.log('can\'t load config ${e.toString()}');
  }

  return jsonDecode(loader);
}

Future<Store> _openStore()async{
  return openStore(directory: 'fast_ai_storage');
}

class LogProviderImpl implements LogProvider {
  @override
  void printLog(String message) {
    developer.log(message, name: 'mobile_fast_ai');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final LogProvider logProvider = LogProviderImpl();

  LogProvider.init(logProvider);

  // Load languages
  await AppLocalizationManager.instance.load();

  final store = await _openStore();

  final rootConfig = await _loadConfig();

  final fastAIConfig = FastAIConfig.fromJson(rootConfig);

  final ErrorHandler fastAiErrorHandler = ErrorHandlerImpl();

  ErrorHandler.setInstance(
    fastAiErrorHandler,
  );

  await di.initDependency(fastAIConfig,store);

  runApp(
    const FastAIApplication(),
  );
}
