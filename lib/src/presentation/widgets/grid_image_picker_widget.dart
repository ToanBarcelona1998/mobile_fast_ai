import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridImagePickerWidget extends StatefulWidget {
  const GridImagePickerWidget({
    Key? key,
    required this.imageFiles,
    required this.appTheme,
    this.count = 1,
    this.onChanged,
    this.label,
    this.onClickItem,
    this.onChooseOverCount,
    this.canEdit = true,
  }) : super(key: key);
  final List<String> imageFiles;
  final int count;
  final void Function(List<String>)? onChanged;
  final void Function(int)? onClickItem;
  final void Function(int)? onChooseOverCount;
  final bool canEdit;
  final AppTheme appTheme;
  final String ?label;

  @override
  State<StatefulWidget> createState() => _GridImagePickerWidgetState();
}

class _GridImagePickerWidgetState extends State<GridImagePickerWidget> {
  final List<String> _imageFiles = List.empty(growable: true);

  @override
  void initState() {
    _imageFiles.addAll(widget.imageFiles);
    super.initState();
  }

  @override
  void didUpdateWidget(GridImagePickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageFiles.length != oldWidget.imageFiles.length) {
      _imageFiles.clear();
      _imageFiles.addAll(widget.imageFiles);
    }
  }

  void _getImage(List<String> images) async {
    try {
      if (images.isEmpty) return;

      int length = _imageFiles.length + images.length;

      if (length > widget.count) {
        widget.onChooseOverCount?.call(length);
        return;
      }

      _imageFiles.addAll(images);
      setState(() {});
      widget.onChanged?.call(_imageFiles);
    } catch (e) {
      // call something else
    }
  }

  @override
  Widget build(BuildContext context) {
    return CombinedGridView(
      data: [
        '',
        ..._imageFiles,
      ],
      builder: (file, index) {
        if (index == 0) {
          return UploadMultiImageWidget(
            appTheme: widget.appTheme,
            onPickImageSuccess: _getImage,
            label: widget.label,
          );
        }
        return _ImagePreview(
          appTheme: widget.appTheme,
          imgFile: file,
          canEdit: widget.canEdit,
          onRemove: () {
            _imageFiles.removeAt(index - 1);
            setState(() {});

            widget.onChanged?.call(_imageFiles);
          },
          onClickItem: () {
            widget.onClickItem?.call(index - 1);
          },
        );
      },
      childCount: 2,
      onRefresh: () {
        //
      },
      onLoadMore: () {
        //
      },
      canLoadMore: false,
      childAspectRatio: 1,
      crossAxisSpacing: Spacing.spacing04,
      mainAxisSpacing: Spacing.spacing05,
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({
    Key? key,
    this.canEdit = false,
    this.onRemove,
    this.onClickItem,
    required this.imgFile,
    required this.appTheme,
  }) : super(key: key);
  final String imgFile;
  final bool canEdit;
  final VoidCallback? onRemove;
  final VoidCallback? onClickItem;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onClickItem,
          child: FileImageWidget(
            imageUrl: imgFile,
            appTheme: appTheme,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
        ),
        if (canEdit)
          Positioned(
            right: Spacing.spacing02,
            top: Spacing.spacing02,
            child: InkWell(
              onTap: onRemove,
              child: SvgPicture.asset(
                AssetIconPath.icCommonCloseCircleRed,
              ),
            ),
          ),
      ],
    );
  }
}
