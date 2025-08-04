import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/app_colors.dart';

class ShowOptionsBottomSheet extends StatelessWidget {
  const ShowOptionsBottomSheet(
      {super.key,
      required this.valuesList,
      this.onTap,
      required this.bottomSheetLabel});
  static builder(BuildContext context,
      {required List<String> valuesList,
      void Function(int)? onTap,
      required String bottomSheetLabel}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return ShowOptionsBottomSheet(
            valuesList: valuesList,
            onTap: onTap,
            bottomSheetLabel: bottomSheetLabel,
          );
        });
  }

  final List<String> valuesList;
  final void Function(int)? onTap;
  final String bottomSheetLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 1.sw,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(bottomSheetLabel,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: valuesList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (onTap != null) {
                          onTap!(index);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: SizedBox(
                            width: 1.sw,
                            child: Text(valuesList.elementAt(index))),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
