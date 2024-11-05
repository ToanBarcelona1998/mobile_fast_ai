import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/presentation/fast_ai_application.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Load languages
  await AppLocalizationManager.instance.load();

  runApp(
    const FastAIApplication(),
  );
}
