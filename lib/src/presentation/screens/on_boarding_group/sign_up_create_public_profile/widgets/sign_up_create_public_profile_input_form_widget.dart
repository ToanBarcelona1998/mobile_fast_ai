import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/choice_select_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/pick_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';

class SignupCreatePublicProfileInputFormWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController nickNameController;
  final TextEditingController bioController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const SignupCreatePublicProfileInputFormWidget({
    required this.userNameController,
    required this.nickNameController,
    required this.bioController,
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
          controller: userNameController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenUserName,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenUserNameHint,
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
          controller: nickNameController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenNickName,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenNickNameHint,
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
        NormalTextInputWidget(
          controller: bioController,
          label: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenBio,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenBioHint,
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
            LanguageKey.onBoardingSignupPublicProfileScreenPronouns,
          ),
          isSelected: (selectedOptions, item) {
            return item == 'Pronoun 1';
          },
          label: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenPronouns,
          ),
          hint: localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenPronounsHint,
          ),
        ),
      ],
    );
  }
}
