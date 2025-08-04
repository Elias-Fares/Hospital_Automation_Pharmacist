import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.borderRadius,
      this.onTap,
      required this.text,
      this.textStyle,
      this.textColor,
      this.fontWeight});
  final double? borderRadius;
  final void Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: textColor, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
