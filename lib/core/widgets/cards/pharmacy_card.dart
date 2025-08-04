

import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../../style/card_container_decoration.dart';
import '../buttons/custom_inkwell.dart';
import '../general_network_image.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    super.key,
    required this.pharmacyName,
    required this.pharmacistName,
    required this.imageUrl,
    this.onPharmacyTap,
  });

  final String pharmacyName;
  final String pharmacistName;
  final String imageUrl;
  final void Function()? onPharmacyTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onPharmacyTap,
      color: containerCardDecoration().color,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: GeneralNetworkImage(
                url: imageUrl,
                boxFit: BoxFit.cover,
                failWidget: _failWidget(context),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pharmacistName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  pharmacyName,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.hintTextColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _failWidget(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: AppColors.primaryDimmed, shape: BoxShape.circle),
      child: Text(
        pharmacistName.length > 2
            ? pharmacistName.substring(0, 1).toUpperCase()
            : "",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
