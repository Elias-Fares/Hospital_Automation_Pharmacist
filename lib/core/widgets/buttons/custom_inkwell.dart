import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({
    super.key,
    this.color,
    this.borderRadius,
    this.child,
    this.splashColor,
    this.highlightColor,
    this.onTap,
    this.borderSide,
  });

  final Widget? child;
  final Color? color;
  final BorderRadius? borderRadius;

  final Color? splashColor;
  final Color? highlightColor;
  final BorderSide? borderSide;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.backgroundColor,

      // borderRadius: borderRadius,
      shape: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.zero,
        borderSide: borderSide ?? BorderSide.none,
      ),

      elevation: 0,

      child: InkWell(
        splashColor: splashColor,

        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (onTap != null) {
              onTap!();
            }
          });
        },
        highlightColor: highlightColor,
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: child,
      ),
    );
  }
}
