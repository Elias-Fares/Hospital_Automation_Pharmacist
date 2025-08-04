import 'package:flutter/material.dart';
import '../../../configuration/res.dart';
import '../../style/app_colors.dart';
import '../buttons/custom_inkwell.dart';
import '../general_image_asset.dart';

class ProfileEmailWidget extends StatelessWidget {
  const ProfileEmailWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onTap,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const GeneralImageAssets(
              path: Res.emailIcon,
              width: 18,
              height: 18,
              boxFit: BoxFit.contain,
              color: AppColors.primary,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              "Email",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
