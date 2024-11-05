import 'package:mobile_fast_ai/src/presentation/widgets/pick_avatar_widget.dart';
import 'package:flutter/material.dart';

class EditProfileAvatarWidget extends StatelessWidget {
  final String avatar;
  final void Function(String) onPickImageSuccess;

  const EditProfileAvatarWidget({
    required this.avatar,
    required this.onPickImageSuccess,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PickAvatarWidget(
      url: avatar,
      onPickImageSuccess: onPickImageSuccess,
    );
  }
}
