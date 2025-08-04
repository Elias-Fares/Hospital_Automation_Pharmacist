import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../general_image_asset.dart';

class SvgContainer extends StatelessWidget {
  const SvgContainer(
      {super.key,
      this.containerPadding,
      required this.imgPath,
      this.imageWidth,
      this.imageHieght,
      this.color});
  final String imgPath;
  final double? imageWidth;
  final double? imageHieght;
  final double? containerPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(containerPadding ?? 6),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: AppColors.backgroundColor, shape: BoxShape.circle),
        child: GeneralImageAssets(
          path: imgPath,
          color: color ?? AppColors.primary,
          width: imageWidth ?? 18,
          height: imageHieght ?? 18,
          boxFit: BoxFit.contain,
        ));
  }
}
