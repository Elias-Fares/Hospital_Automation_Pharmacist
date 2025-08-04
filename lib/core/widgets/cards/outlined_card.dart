import 'package:flutter/material.dart';
import '../../style/app_colors.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({super.key, required this.text, this.icon});

  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(
              width: 4,
            ),
          ],
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
