import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/image_picker_helper.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickAvatarWidget extends StatelessWidget {
  final PhotoType avatarType;
  final ImageType imageType;
  final String url;
  final double height;
  final double width;
  final BoxFit fit;
  final void Function(String) onPickImageSuccess;

  const PickAvatarWidget({
    this.avatarType = PhotoType.network,
    required this.url,
    required this.onPickImageSuccess,
    this.height = BoxSize.boxSize14,
    this.width = BoxSize.boxSize14,
    this.imageType = ImageType.normal,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatarWidget(
          url: url,
          height: height,
          width: width,
          avatarType: avatarType,
          imageType: imageType,
          fit: fit,
        ),
        Positioned(
          bottom: Spacing.spacing03,
          right: Spacing.spacing02,
          child: GestureDetector(
            onTap: _onClickEdit,
            behavior: HitTestBehavior.opaque,
            child: SvgPicture.asset(
              AssetIconPath.icCommonEditActive,
            ),
          ),
        ),
      ],
    );
  }

  void _onClickEdit()async{
    final String ? file = await ImagePickerHelper.pickSingleImage();

    if(file != null){
      onPickImageSuccess(file);
    }
  }
}
