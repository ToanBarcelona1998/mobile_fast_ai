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

class SignupPersonalInfoInputFormWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const SignupPersonalInfoInputFormWidget({
    required this.fullNameController,
    required this.phoneNumberController,
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PickAvatarWidget(
          url: AssetImagePath.commonDefaultAvatar,
          onPickImageSuccess: (imgPath) {},
          avatarType: PhotoType.assets,
          imageType: ImageType.svg,
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        NormalTextInputWidget(
          controller: fullNameController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenFullName,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenFullNameHint,
          ),
          constraintManager: ConstraintManager()
            ..notEmpty(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        NormalTextInputWidget(
          controller: phoneNumberController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenPhoneNumber,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenPhoneNumberHint,
          ),
          constraintManager: ConstraintManager()
            ..phone(
              errorMessage: localization.translate(
                '',
              ),
            ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
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
            LanguageKey.onBoardingSignupPersonalInfoScreenDateOfBirth,
          ),
          hint: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenDateOfBirthHint,
          ),
          suffix: SvgPicture.asset(
            AssetIconPath.icCommonCalendar,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
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
            LanguageKey.onBoardingSignupPersonalInfoScreenGender,
          ),
          isSelected: (selectedOptions, item) {
            return item == 'Male';
          },
          label: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenGender,
          ),
        ),
      ],
    );
  }
}
