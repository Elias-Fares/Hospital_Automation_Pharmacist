import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/app_colors.dart';

class KeyValueCard extends StatelessWidget {
  const KeyValueCard({super.key, required this.keyTitle, required this.value});

  final String keyTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(minWidth: 90.w),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            keyTitle,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.onPrimaryContainerBlue,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimaryContainer,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
