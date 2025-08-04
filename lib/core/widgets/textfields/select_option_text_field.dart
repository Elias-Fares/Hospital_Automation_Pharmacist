import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cards/loading_card.dart';
import 'show_options_bottom_sheet.dart';

import '../../style/app_colors.dart';

class SelectOptionsTextField extends StatelessWidget {
  const SelectOptionsTextField({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.hintText,
    required this.bottomSheetTitle,
    required this.optionsList,
    this.onTap,
    this.isLoading,
  });

  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String bottomSheetTitle;

  final List<String> optionsList;
  final void Function(int)? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return (isLoading ?? false)
        ? LoadingCard(
            borderRadius: BorderRadius.circular(6),
            width: 1.sw,
            height: 45,
          )
        : TextFormField(
            controller: textEditingController,
            validator: validator,
            readOnly: true,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.primary,
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            onTap: () {
              ShowOptionsBottomSheet.builder(context,
                  bottomSheetLabel: bottomSheetTitle,
                  valuesList: optionsList,
                  onTap: onTap);
            },
          );
  }
}
