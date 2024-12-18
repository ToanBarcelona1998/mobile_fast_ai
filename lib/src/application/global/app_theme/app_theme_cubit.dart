import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
import 'app_theme_impl.dart';

final class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit()
      : super(
          AppLightThemeImpl(),
        );

  void changeAppTheme(AppTheme appTheme) {
    emit(appTheme);
  }

  static AppThemeCubit of(BuildContext context) => BlocProvider.of<AppThemeCubit>(context);
}
