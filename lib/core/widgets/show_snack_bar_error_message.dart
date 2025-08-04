import 'package:flutter/material.dart';
import '../style/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarErrorMessage(BuildContext context,
    {required String message, Color? color}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      // backgroundColor: color ?? const Color(0xffff5252),
      borderRadius: BorderRadius.circular(5),
      textAlign: TextAlign.start,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.white,
          ),
    ),
  );
}
