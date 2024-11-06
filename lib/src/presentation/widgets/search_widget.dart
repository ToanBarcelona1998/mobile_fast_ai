import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String? hint;
  final TextEditingController searchController;
  final void Function(String value, bool isValid)? onChanged;
  final void Function(String value, bool isValid)? onSubmit;

  const SearchWidget({
    required this.appTheme,
    required this.hint,
    required this.searchController,
    this.onChanged,
    this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.spacing03,
        horizontal: Spacing.spacing05,
      ),
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor100,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius04,
        ),
      ),
      child: TextInputOnlyTextFieldWidget(
        controller: searchController,
        hintText: hint,
        onChanged: onChanged,
        maxLine: 1,
        onSubmit: onSubmit,
        leading: SvgPicture.asset(
          AssetIconPath.icCommonSearch,
        ),
      ),
    );
  }
}
