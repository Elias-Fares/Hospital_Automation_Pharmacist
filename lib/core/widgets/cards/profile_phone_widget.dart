import 'package:flutter/material.dart';
import '../../../configuration/res.dart';
import '../../style/app_colors.dart';
import '../buttons/custom_inkwell.dart';
import '../general_image_asset.dart';

class ProfilePhoneWidget extends StatelessWidget {
  const ProfilePhoneWidget({super.key, this.onTap, required this.phoneNumber});
  final void Function()? onTap;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onTap,
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const GeneralImageAssets(
              path: Res.phoneIcon,
              width: 18,
              height: 18,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              phoneNumber,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
