import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cards/loading_card.dart';
import '../../style/app_colors.dart';

/// A customizable text field widget that displays a list of selectable options in a modal bottom sheet.
///
/// [SelectOptionsTextFieldV2] is a generic widget that allows users to select an option from a provided list.
/// The selected value is displayed in the text field, and the options are shown in a modal bottom sheet.
///
/// Type parameter [T] is the type of the options in the list.
class SelectOptionsTextFieldV2<T> extends StatelessWidget {
  const SelectOptionsTextFieldV2({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.hintText,
    required this.bottomSheetTitle,
    required this.optionsList,
    required this.onTap,
    this.isLoading = false,
    required this.displayStringForOption,
    this.bottomSheetHeight = 400,
  });

  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String bottomSheetTitle;

  final List<T> optionsList;
  final String Function(T element) displayStringForOption;
  final void Function(T selectedElement) onTap;
  final bool isLoading;
  final double bottomSheetHeight;

  @override
  Widget build(BuildContext context) {
    return isLoading
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
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: bottomSheetHeight.h,
                  width: 1.sw,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bottomSheetTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: optionsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    final selectedOption = optionsList
                                        .elementAt(index);
                                    textEditingController.text =
                                        displayStringForOption(selectedOption);
                                    onTap(selectedOption);
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    child: SizedBox(
                                      width: 1.sw,
                                      child: Text(
                                        displayStringForOption(
                                          optionsList.elementAt(index),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 0.5),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
  }
}
