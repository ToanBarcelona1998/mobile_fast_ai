import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_global/app_global_cubit.dart';
import 'package:mobile_fast_ai/src/application/global/app_global/app_global_state.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'splash_state.dart';
import 'splash_cubit.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with StateFulBaseScreen {

  final SplashCubit _cubit = getIt.get<SplashCubit>();

  @override
  void initState() {
    _cubit.starting();
    super.initState();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetLogoPath.logo,
              ),
              const SizedBox(
                height: BoxSize.boxSize07,
              ),
              Text(
                localization.translate(
                  LanguageKey.globalAppName,
                ),
                style: AppTypography.heading2Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
              ),
            ],
          ),
        ),
        AppLoadingWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize08,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<SplashCubit,SplashState>(
        listener: (context, state) {
          switch(state.status){
            case SplashStatus.loading:
              break;
            case SplashStatus.checkedIn:
              AppGlobalCubit.of(context).changeStatus(AppGlobalStatus.authorized);
              break;
            case SplashStatus.error:
              AppNavigator.replaceWith(RoutePath.walkThrough);
              break;
          }
        },
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
