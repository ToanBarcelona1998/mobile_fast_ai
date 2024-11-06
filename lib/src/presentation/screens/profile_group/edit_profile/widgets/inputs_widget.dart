import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/choice_select_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class EditProfileInputsWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController nickNameController;
  final TextEditingController bioController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const EditProfileInputsWidget({
    required this.userNameController,
    required this.bioController,
    required this.nickNameController,
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalTextInputWidget(
          controller: userNameController,
          label: localization.translate(
            LanguageKey.editProfileScreenUserName,
          ),
          hintText: localization.translate(
            LanguageKey.editProfileScreenUserNameHint,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: nickNameController,
          label: localization.translate(
            LanguageKey.editProfileScreenNickName,
          ),
          hintText: localization.translate(
            LanguageKey.editProfileScreenNickNameHint,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        ChoiceSelectWidget(
          data: const ['Pronoun 1', 'Pronoun 2', 'Pronoun 3'],
          builder: (pronouns) {
            return Text(
              pronouns.join(),
              style: AppTypography.bodyLargeMedium.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            );
          },
          selectedData: const [
            'Pronoun 1',
          ],
          optionBuilder: (pronoun) {
            return Text(
              pronoun,
              style: AppTypography.bodyLargeRegular.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            );
          },
          modalTitle: localization.translate(
            LanguageKey.editProfileScreenPronouns,
          ),
          isSelected: (selectedOptions, item) {
            return item == 'Pronoun 1';
          },
          label: localization.translate(
            LanguageKey.editProfileScreenPronouns,
          ),
          hint: localization.translate(
            LanguageKey.editProfileScreenPronounsHint,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NormalTextInputWidget(
          controller: bioController,
          label: localization.translate(
            LanguageKey.editProfileScreenBio,
          ),
          hintText: localization.translate(
            LanguageKey.editProfileScreenBioHint,
          ),
        ),
      ],
    );
  }
}
