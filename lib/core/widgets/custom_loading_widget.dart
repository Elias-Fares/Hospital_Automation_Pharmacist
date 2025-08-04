import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.width,
    this.height,
    this.color,
  });
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width ?? 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: color ?? AppColors.primary,
            ),
          ],
        ));
  }
}
