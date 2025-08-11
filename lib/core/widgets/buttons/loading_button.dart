import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/app_colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading,
    this.width,
    this.color,
    this.borderRaduis,
    this.border,
    this.textStyle,
    this.height,
    this.loadingIndicatorSize = 25,
    this.loadingIndicatorStrokeWidth = 3,
  });
  final String title;
  final void Function()? onTap;
  final bool? isLoading;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRaduis;
  final Border? border;
  final TextStyle? textStyle;
  final double loadingIndicatorSize;
  final double loadingIndicatorStrokeWidth;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).primaryColor,
      borderRadius: borderRaduis ?? BorderRadius.circular(50),
      child: InkWell(
        borderRadius: borderRaduis ?? BorderRadius.circular(50),
        onTap: !(isLoading ?? false) ? onTap : () {},
        child: Container(
          height: height ?? 45.h,
          width: width ?? MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRaduis ?? BorderRadius.circular(50),
          ),
          child:
              !(isLoading ?? false)
                  ? Text(
                    title,
                    style:
                        textStyle ??
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  )
                  : SizedBox(
                    width: loadingIndicatorSize,
                    height: loadingIndicatorSize,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: loadingIndicatorStrokeWidth,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
        ),
      ),
    );
  }
}
