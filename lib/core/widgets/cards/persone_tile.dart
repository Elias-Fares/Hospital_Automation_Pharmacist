import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../general_network_image.dart';

class PersoneTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const PersoneTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: GeneralNetworkImage(
              url: imageUrl,
              width: 40,
              height: 40,
              boxFit: BoxFit.cover,
              failWidget: _failWidget(context),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              subtitle.isNotEmpty
                  ? Text(
                      subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.hintTextColor),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
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
        title.length > 2 ? title.substring(0, 1).toUpperCase() : "",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
