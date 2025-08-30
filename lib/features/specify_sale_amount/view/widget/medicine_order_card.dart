part of '../specify_sale_amount_screen.dart';

class MedicineOrderCard extends StatelessWidget {
  const MedicineOrderCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
    this.onMedicineTap,
    required this.quantity,
    this.onSpecifySaleAmountTap,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;
  final int quantity;
  final void Function()? onMedicineTap;
  final void Function()? onSpecifySaleAmountTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onMedicineTap,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: GeneralNetworkImage(
                url: imageUrl,
                height: 120,
                width: 160.w,
                boxFit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(medName, style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(width: 4),
                Text(
                  "($medTiter)",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.hintTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "$medPrice S.P.",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 8),

            CustomOutlinedButton(
              onTap: onSpecifySaleAmountTap,

              height: 33,
              title: "Requested Quantity: ${quantity.toString()}",
              titleTextStyle: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
