import 'app_theme_impl.dart';

import 'app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit()
      : super(
          AppLightThemeImpl(),
        );

  void changeAppTheme(AppTheme appTheme) {
    emit(appTheme);
  }
}
