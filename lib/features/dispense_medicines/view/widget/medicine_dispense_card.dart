part of '../dispense_medicines_screen.dart';

class MedicineDispenseCard extends StatelessWidget {
  const MedicineDispenseCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
    this.onMedicineTap,
    this.onDespenseTap,
    required this.dispenseAlt,
    required this.altsCount,
    this.onAltTap,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;
  final void Function()? onMedicineTap;
  final void Function()? onDespenseTap;
  final void Function()? onAltTap;
  final bool dispenseAlt;
  final int altsCount;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onMedicineTap,
      child: Container(
        decoration: containerCardDecoration(),
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
                    color: AppColors.outlineVariant,
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
            SizedBox(height: 10),
            dispenseAlt
                ? CustomInkwell(
                  onTap: onAltTap,
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 30,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.sync_outlined,
                          size: 16,
                          color: AppColors.primary,
                        ),
                        Text(
                          "$altsCount Alternatives",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.hintTextColor),
                        ),

                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                          color: AppColors.hintTextColor,
                        ),
                      ],
                    ),
                  ),
                )
                : LoadingButton(
                  title: "Mark as dispensed",
                  height: 30,
                  onTap: onDespenseTap,
                ),
          ],
        ),
      ),
    );
  }
}
