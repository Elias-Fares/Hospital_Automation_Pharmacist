import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import '../../style/app_colors.dart';
// import '../../../features/main_screen/main_screen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.openDrawer});
  final void Function()? openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            mainScreenScaffoldKey.currentState?.openDrawer();
            
          },
   
          icon: const Icon(Icons.menu, color: Colors.black)),
      titleSpacing: 0,
    
      title: const Text('MediCare', style: TextStyle(color: Colors.black)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
