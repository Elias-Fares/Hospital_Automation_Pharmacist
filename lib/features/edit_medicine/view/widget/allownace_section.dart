part of '../edit_medicine_screen.dart';
class AllownaceSection extends StatelessWidget {
  const AllownaceSection({
    super.key,
    required this.isAllowedWithoutPrescription,
  });

  final bool isAllowedWithoutPrescription;

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
            ),
            SizedBox(width: 15),
            _buildElement(
              condition: isAllowedWithoutPrescription == true,
              text: "No Prescription",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildElement({required bool condition, required String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: containerCardDecoration().copyWith(
          color: condition ? AppColors.backgroundColor : AppColors.white,
          border: Border.all(
            color: condition ? AppColors.primary : AppColors.transparent,
          ),
        ),
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
                      condition ? AppColors.primary : AppColors.outlineVariant,
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}
