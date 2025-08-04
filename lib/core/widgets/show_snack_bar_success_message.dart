import 'package:flutter/material.dart';
import '../style/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBarSuccessMessage(BuildContext context,
    {required String message, Color? color}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      backgroundColor: AppColors.greenText,
      borderRadius: BorderRadius.circular(5),
      textAlign: TextAlign.start,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.white,
          ),
    ),
  );
}
