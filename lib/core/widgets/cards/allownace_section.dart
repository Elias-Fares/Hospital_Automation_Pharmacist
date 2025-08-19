

import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';

class AllownaceSection extends StatelessWidget {
  const AllownaceSection({
    super.key,
    required this.isAllowedWithoutPrescription,
    required this.onChanged,
  });

  final bool isAllowedWithoutPrescription;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Allownace", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),

        Row(
          children: [
            _buildElement(
              condition: isAllowedWithoutPrescription == false,
              text: "With Prescription",
              onTap: () {
                onChanged(false);
              },
            ),
            SizedBox(width: 15),
            _buildElement(
              condition: isAllowedWithoutPrescription == true,
              text: "No Prescription",
              onTap: () {
                onChanged(true);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildElement({
    required bool condition,
    required String text,
    void Function()? onTap,
  }) {
    return Expanded(
      child: CustomInkwell(
        onTap: onTap,
        borderSide: BorderSide(
          color: condition ? AppColors.primary : AppColors.transparent,
        ),
        color: condition ? AppColors.backgroundColor : AppColors.white,

        borderRadius: BorderRadius.circular(8),

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color:
                        condition
                            ? AppColors.primary
                            : AppColors.outlineVariant,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
