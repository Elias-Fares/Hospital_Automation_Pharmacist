import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';

class FloatingActionButtonFadedElevation extends StatelessWidget {
  const FloatingActionButtonFadedElevation({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.transparent,
            offset: Offset(0, 40),
            blurRadius: 50,
          ),
        ],

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundColor.withValues(alpha: 0),
            AppColors.backgroundColor.withValues(alpha: .6),
            AppColors.backgroundColor,
          ],
        ),
      ),
      child: LoadingButton(onTap: onTap, title: title),
    );
  }
}
