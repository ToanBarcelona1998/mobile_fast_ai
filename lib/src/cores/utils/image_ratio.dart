final class ImageRatio {
  final int width;
  final int height;

  const ImageRatio({
    required this.width,
    required this.height,
  });
}

extension ImageRatioE on int {
  ImageRatio fromRatio() {
    switch (this) {
      case 1:
        return const ImageRatio(width: 512, height: 512,);
      case 2:
        return const ImageRatio(width: 288, height: 512,);
      case 3:
        return const ImageRatio(width: 910, height: 512,);
      case 4:
        return const ImageRatio(width: 384, height: 512,);
      default:
        return const ImageRatio(width: 512, height: 512,);
    }
  }
}
