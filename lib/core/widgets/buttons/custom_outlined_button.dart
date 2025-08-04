import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import 'custom_inkwell.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key,
      required this.title,
      this.borderColor,
      this.textColor,
      required this.radius,
      this.onTap});
  final String title;
  final Color? borderColor;
  final Color? textColor;
  final double radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onTap,
      color: AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? AppColors.primary),
            borderRadius: BorderRadius.circular(radius)),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: textColor ?? AppColors.primary),
        ),
      ),
    );
  }
}
