import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell(
      {super.key,
      this.color,
      this.borderRadius,
      this.child,
      this.splashColor,
      this.highlightColor,
      this.onTap});

  final Widget? child;
  final Color? color;
  final BorderRadius? borderRadius;

  final Color? splashColor;
  final Color? highlightColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: splashColor,
        onTap: () {
          Future.delayed(
            const Duration(milliseconds: 100),
            () {
              if (onTap != null) {
                onTap!();
              }
            },
          );
        },
        highlightColor: highlightColor,
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: child,
      ),
    );
  }
}
