import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../buttons/custom_inkwell.dart';
import 'icon_container.dart';
import 'svg_container.dart';

class IconKeyValueWidget extends StatelessWidget {
  const IconKeyValueWidget(
      {super.key,
      this.iconPath,
      required this.keyTitle,
      required this.value,
      this.needOnTap = false,
      this.onTap,
      this.iconData,
      this.width});

  final String? iconPath;
  final IconData? iconData;
  final String keyTitle;
  final String value;
  final bool needOnTap;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return needOnTap
        ? CustomInkwell(
            onTap: onTap,
            color: AppColors.white,
            child: getWidget(context),
          )
        : getWidget(context);
  }

  Row getWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (iconPath != null) ...[
          // GeneralImageAssets(
          //   path: iconPath!,
          //   width: 24,
          //   height: 24,
          //   boxFit: BoxFit.contain,
          // ),
          SvgContainer(imgPath: iconPath!)
        ],
        if (iconData != null) ...[
          IconContainer(
            iconData: iconData!,
          )
        ],
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keyTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.hintTextColor),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: width,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        if (needOnTap) ...[
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: AppColors.hintTextColor,
          )
        ]
      ],
    );
  }
}
