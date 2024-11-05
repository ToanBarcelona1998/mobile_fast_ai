import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBuilder extends StatelessWidget {
  final Widget Function(AppTheme appTheme) builder;

  const AppThemeBuilder({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit,AppTheme>(
      builder: (context, state) {
        return builder(state);
      },
    );
  }
}
