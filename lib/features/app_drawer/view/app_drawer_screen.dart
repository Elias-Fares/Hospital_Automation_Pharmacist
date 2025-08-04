import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/general_image_asset.dart';
import '../view_model/riverpod/app_drawer_view_model.dart';

class AppDrawerScreen extends ConsumerWidget {
  const AppDrawerScreen({super.key, required this.mainScreenKey});

  final GlobalKey<ScaffoldState> mainScreenKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDrawerState = ref.watch(appDrawerViewModelProvider);
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.backgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 30),
            ...List.generate(appDrawerState.drawerElements.length, (index) {
              final element = appDrawerState.drawerElements.elementAt(index);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomInkwell(
                  onTap: () {
                    context.push(element.routeName ?? "");
                    mainScreenScaffoldKey.currentState?.closeDrawer();
                  },
                  splashColor: AppColors.primaryContainer,
                  highlightColor: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        GeneralImageAssets(
                          path: element.iconPath,
                          width: 24,
                          height: 24,
                          boxFit: BoxFit.contain,
                          color: AppColors.textColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          element.title,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
