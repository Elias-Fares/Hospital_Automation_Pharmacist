import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/general_image_asset.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.email,
    required this.imgPath,
  });
  final String email;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.outlineVariant, width: 1),
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: GeneralImageAssets(
                path: imgPath,
                width: 30,
                height: 30,
                boxFit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
