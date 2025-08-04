import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/app_colors.dart';

import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final BoxShape shape;

  const LoadingCard(
      {super.key,
      this.height = 24,
      this.width,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.borderRadius,
      this.child,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseShimmerColor ?? AppColors.baserColor,
      highlightColor: highlightShimmerColor ?? AppColors.shimmerColor,
      child: Container(
        height: height,
        width: width ?? 40.w,
        decoration: BoxDecoration(
            borderRadius: shape == BoxShape.circle
                ? null
                : (borderRadius ?? BorderRadius.circular(2.r)),
            shape: shape,
            color: cardColor ?? AppColors.baserColor),
        child: child,
      ),
    );
  }
}
