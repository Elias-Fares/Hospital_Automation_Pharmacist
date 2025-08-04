import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../style/app_colors.dart';

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SubAppBar({super.key, this.titleWidget, this.withSearch = false});

  final Widget? titleWidget;
  final bool withSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)),
      titleSpacing: 0,
      title: titleWidget,
      actions: withSearch
          ? [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.onSurface,
                    size: 18,
                  )),
              const SizedBox(
                width: 10,
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
