import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoiceModalWidget<T> extends AppBottomSheetProviderWidget {
  final String title;
  final List<T> data;
  final List<T> selectedData;
  final VoidCallback? onClose;
  final Widget Function(T) builder;
  final bool Function(List<T>, T) isSelected;

  const ChoiceModalWidget({
    required this.data,
    required this.title,
    this.onClose,
    required this.builder,
    required this.selectedData,
    required super.appTheme,
    required this.isSelected,
    super.fit = ChoiceModalFit.fill,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
   return null;
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: data.length,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final T item = data[index];
        return Padding(
          padding: const EdgeInsets.only(
            bottom: Spacing.spacing05,
          ),
          child: GestureDetector(
            onTap: () {
              _onItemTap(item);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _selectBoxBuilder(item),
                const SizedBox(
                  width: BoxSize.boxSize04,
                ),
                Expanded(
                  child: builder(item),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.heading4SemiBold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize03,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (onClose == null) {
              AppNavigator.pop();
            } else {
              onClose?.call();
            }
          },
          child: SvgPicture.asset(
            AssetIconPath.icCommonCloseBottomSheet,
          ),
        ),
      ],
    );
  }

  Widget _selectBoxBuilder(T item) {
    final bool isSelectedItem = isSelected(selectedData, item);
    return isSelectedItem
        ? SvgPicture.asset(
            AssetIconPath.icCommonRadioCheck,
          )
        : SvgPicture.asset(
            AssetIconPath.icCommonRadio,
          );
  }

  void _onItemTap(T item) {
    AppNavigator.pop([
      item,
    ]);
  }
}
