import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/app_colors.dart';
import 'custom_inkwell.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    this.borderColor,
    this.textColor,
    this.radius,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.icon,
  });
  final String title;
  final Color? borderColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onTap,
      color: backgroundColor ?? AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(radius ?? 50),
      child: Container(
        width: width,
        height: height ?? 40.h,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColors.primary),
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, SizedBox(width: 5)],
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ?? AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
