import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullScreenDialogLayout extends StatelessWidget {
  final Widget child;
  final VoidCallback ?onClose;

  const FullScreenDialogLayout({
    required this.child,
    this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return PopScope(
          canPop: false,
          child: GestureDetector(
            onTap: onClose ?? () {
              AppNavigator.pop();
            },
            child: Scaffold(
              backgroundColor: appTheme.otherColorBlack.withOpacity(
                0.6,
              ),
              body: GestureDetector(
                onTap: (){
                  AppNavigator.pop();
                },
                child: SizedBox(
                  width: context.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.spacing07,
                      vertical: Spacing.spacing08,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            //
                          },
                          child: child,
                        ),
                        const SizedBox(
                          height: BoxSize.boxSize05,
                        ),
                        SvgPicture.asset(
                          AssetIconPath.icCommonCloseWhite,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showFullScreenDialog<T>(
    BuildContext context, {
    required Widget child,
  }) {
    return showGeneralDialog<T>(
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FullScreenDialogLayout(
          child: child,
        );
      },
    );
  }
}
