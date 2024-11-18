import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/date_picker_helper.dart';
import 'package:mobile_fast_ai/src/cores/utils/app_date_formatter.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/choice_select_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/label_input_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/pick_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPersonalInfoInputFormWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final List<String> genders;

  const SignupPersonalInfoInputFormWidget({
    required this.userNameController,
    required this.phoneNumberController,
    required this.addressController,
    required this.appTheme,
    required this.localization,
    required this.genders,
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
          controller: userNameController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenUserName,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenUserNameHint,
          ),
          onChanged: (userName, _) {
            _onUserNameChange(context, userName);
          },
          constraintManager: ConstraintManager()
            ..notEmpty(
              errorMessage: localization.translate(
                LanguageKey.onBoardingSignupPersonalInfoScreenUserNameInvalid,
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
                LanguageKey.onBoardingSignupPersonalInfoScreenPhoneNumberInValid,
              ),
            ),
          onChanged: (phoneNumber, _) {
            _onPhoneNumberChange(context, phoneNumber);
          },
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        NormalTextInputWidget(
          controller: addressController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenAddress,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPersonalInfoScreenAddressHint,
          ),
          onChanged: (phoneNumber, _) {
            _onPhoneNumberChange(context, phoneNumber);
          },
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        LabelInputWidget(
          onTap: () => _onBirthdayClick(context),
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
        SignUpPersonalInfoGenderSelector(
          builder: (gender) {
            return ChoiceSelectWidget(
              data: genders,
              builder: (genders) {
                return Text(
                  genders.join(),
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                );
              },
              selectedData: [
                genders[gender]
              ],
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
                final index = genders.indexOf(item);

                return index == gender;
              },
              label: localization.translate(
                LanguageKey.onBoardingSignupPersonalInfoScreenGender,
              ),
            );
          }
        ),
      ],
    );
  }

  Future<String?> _onBirthdayClick(BuildContext context) async {
    final CupertinoDatePickerHelper picker = CupertinoDatePickerHelper(
      appTheme: appTheme,
    );
    final DateTime? dateTime = await picker.showDatePicker(
      context,
      onConfirm: (p0) {},
    );

    if (dateTime == null) {
      return null;
    }
    final String birthday =
        AppDateFormatter.monthDayYearWithHyphen.format(dateTime);

    if(context.mounted){
      SignUpPersonalInfoBloc.of(context).add(
        SignUpPersonalInfoEventOnBirthdayChange(
          birthday,
        ),
      );
    }

    return birthday;
  }

  void _onUserNameChange(BuildContext context, String userName) {
    SignUpPersonalInfoBloc.of(context).add(
      SignUpPersonalInfoEventOnUserNameChange(
        userName,
      ),
    );
  }

  void _onPhoneNumberChange(BuildContext context, String phoneNumber) {
    SignUpPersonalInfoBloc.of(context).add(
      SignUpPersonalInfoEvent.onPhoneNumberChange(
        phoneNumber,
      ),
    );
  }
}
