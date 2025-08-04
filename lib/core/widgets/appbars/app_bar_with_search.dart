import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';

class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithSearch({
    super.key,
    required this.searchTextEditingController,
    this.onEditingComplete,
  });
  final TextEditingController searchTextEditingController;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leadingWidth: 40,
      titleSpacing: 10,
      title: SizedBox(
        // width: 1.sw * 0.8,
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Enter medicine name here",
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            suffixIcon: Icon(Icons.search_rounded, color: AppColors.primary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.primary, // A color for the focused state
                width: 2.0,
              ),
            ),
            // Define the border for the enabled state
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.white, // A color for the enabled state
                width: 1.0,
              ),
            ),
          ),
          controller: searchTextEditingController,
          onEditingComplete: onEditingComplete,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
