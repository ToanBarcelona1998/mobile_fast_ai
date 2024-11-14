import 'package:mobile_fast_ai/src/application/global/app_global/app_global_cubit.dart';
import 'package:mobile_fast_ai/src/application/global/app_global/app_global_state.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_cubit.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_translations_delegate.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FastAIApplication extends StatefulWidget {
  const FastAIApplication({super.key});

  @override
  State<FastAIApplication> createState() => _FastAIApplicationState();
}

class _FastAIApplicationState extends State<FastAIApplication>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (WidgetsBinding.instance.focusManager.primaryFocus?.hasFocus ??
            false) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AppTypography.urBanistFontFamily,
        ),
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
        locale: AppLocalizationManager.instance.getAppLocale(),
        localizationsDelegates: const [
          AppTranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: RoutePath.splash,
        supportedLocales: AppLocalizationManager.instance.supportedLang
            .map(
              (e) => Locale(e),
            )
            .toList(),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppThemeCubit(),
              ),
              BlocProvider(
                create: (context) => AppGlobalCubit(),
              )
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<AppGlobalCubit,AppGlobalState>(
                  listenWhen: (previous, current) => previous.status != current.status,
                  listener: _onListenAppGlobalStateChange,
                ),
              ],
              child: Overlay(
                initialEntries: [
                  OverlayEntry(builder: (context) {
                    return child ?? const SizedBox.shrink();
                  },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onListenAppGlobalStateChange(BuildContext context,AppGlobalState state){
    switch(state.status){
      case AppGlobalStatus.authorized:
        AppNavigator.push(RoutePath.home);
        break;
      case AppGlobalStatus.unauthorized:
        AppNavigator.replaceAllWith(RoutePath.signInWithPassword);
        break;
    }
  }
}
