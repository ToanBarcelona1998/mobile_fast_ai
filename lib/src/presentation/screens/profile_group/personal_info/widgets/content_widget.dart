import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/date_picker_helper.dart';
import 'package:mobile_fast_ai/src/cores/utils/app_date_formatter.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/choice_select_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/label_input_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/pick_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoContentWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController streetAddressController;
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const PersonalInfoContentWidget({
    required this.phoneNumberController,
    required this.fullNameController,
    required this.emailController,
    required this.streetAddressController,
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PickAvatarWidget(
          url: AssetImagePath.commonDefaultAvatar,
          onPickImageSuccess: (imgPath) {},
          avatarType: PhotoType.assets,
          imageType: ImageType.svg,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: fullNameController,
          label: localization.translate(
            LanguageKey.personalInfoScreenFullName,
          ),
          hintText: localization.translate(
            LanguageKey.personalInfoScreenFullName,
          ),
          constraintManager: ConstraintManager()
            ..notEmpty(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: emailController,
          label: localization.translate(
            LanguageKey.personalInfoScreenEmail,
          ),
          hintText: localization.translate(
            LanguageKey.personalInfoScreenEmail,
          ),
          constraintManager: ConstraintManager()
            ..email(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: phoneNumberController,
          label: localization.translate(
            LanguageKey.personalInfoScreenPhoneNumber,
          ),
          hintText: localization.translate(
            LanguageKey.personalInfoScreenPhoneNumber,
          ),
          constraintManager: ConstraintManager()
            ..phone(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        LabelInputWidget(
          onTap: () async {
            final CupertinoDatePickerHelper  picker = CupertinoDatePickerHelper(
              appTheme: appTheme,
            );
            final DateTime ? dateTime = await picker.showDatePicker(
              context,
              onConfirm: (p0) {},
            );

            if(dateTime == null){
              return null;
            }
            return AppDateFormatter.monthDayYearWithHyphen.format(dateTime);
          },
          onChanged: (value) {},
          label: localization.translate(
            LanguageKey.personalInfoScreenDateOfBirth,
          ),
          hint: localization.translate(
            LanguageKey.personalInfoScreenDateOfBirth,
          ),
          suffix: SvgPicture.asset(
            AssetIconPath.icCommonCalendar,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        ChoiceSelectWidget(
          data: const ['Male', 'Female', 'Other'],
          builder: (genders) {
            return Text(
              genders.join(),
              style: AppTypography.bodyLargeMedium.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            );
          },
          optionBuilder: (gender) {
            return Text(
              gender,
              style: AppTypography.bodyLargeRegular.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            );
          },
          modalTitle: localization.translate(
            LanguageKey.personalInfoScreenGender,
          ),
          isSelected: (selectedOptions, item) {
            return item == 'Male';
          },
          label: localization.translate(
            LanguageKey.personalInfoScreenGender,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: streetAddressController,
          label: localization.translate(
            LanguageKey.personalInfoScreenStreetAddress,
          ),
          hintText: localization.translate(
            LanguageKey.personalInfoScreenStreetAddress,
          ),
          constraintManager: ConstraintManager()
            ..phone(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
      ],
    );
  }
}
