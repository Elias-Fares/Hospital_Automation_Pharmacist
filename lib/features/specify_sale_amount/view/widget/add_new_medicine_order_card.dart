part of '../specify_sale_amount_screen.dart';
class AddNewMedicineOrderCard extends StatelessWidget {
  const AddNewMedicineOrderCard({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(8),
        color: AppColors.outline.withValues(alpha: .5),
      ),
      child: CustomInkwell(
        onTap: onTap,

        color: AppColors.white.withValues(alpha: .5),
        child: Center(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
