import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../general_network_image.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    required this.title,
    this.imagePath,
    this.subtitle,
  });

  final String? imagePath;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
            child: GeneralNetworkImage(
                url: imagePath ?? "",
                width: 35,
                height: 35,
                boxFit: BoxFit.cover,
                failWidget: _failWidget(context))),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.hintTextColor),
              ),
            ]
          ],
        ),
      ],
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
        title.length > 2 ? title.substring(0, 1) : "",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
