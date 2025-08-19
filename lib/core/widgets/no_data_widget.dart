import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.message,
    this.height,
    this.mainAxisAlignment,
    this.textStyle,
  });

  final String message;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: height,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,

        children: [
          // Icon(Icons.dataset_outlined, color: AppColors.primary, size: 50),
          GeneralImageAssets(
            path: Res.notFoundImage,
            width: 150,
            height: 150,
            boxFit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
