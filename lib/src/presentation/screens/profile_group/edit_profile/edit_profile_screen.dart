import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/edit_profile/widgets/avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/edit_profile/widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/edit_profile/widgets/inputs_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _userNameController,
      _nickNameController,
      _bioController;

  @override
  void initState() {
    _userNameController = TextEditingController()..text = '';
    _nickNameController = TextEditingController()..text = '';
    _bioController = TextEditingController()..text = '';
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _nickNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.editProfileScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Spacing.spacing07,
                            horizontal: Spacing.spacing05,
                          ),
                          child: Column(
                            children: [
                              EditProfileAvatarWidget(
                                avatar: randomDummyImg(),
                                onPickImageSuccess: (_) {

                                },
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize07,
                              ),
                              EditProfileInputsWidget(
                                userNameController: _userNameController,
                                bioController: _bioController,
                                nickNameController: _nickNameController,
                                localization: localization,
                                appTheme: appTheme,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    EditProfileBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
