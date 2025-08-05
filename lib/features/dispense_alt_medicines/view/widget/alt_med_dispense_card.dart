part of '../dispense_alt_medicines_screen.dart';

class AltMedDispenseCard extends StatelessWidget {
  const AltMedDispenseCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
    this.onMedicineTap,
    this.onDespenseTap,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;
  final void Function()? onMedicineTap;
  final void Function()? onDespenseTap;

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
            CustomOutlinedButton(
              title: "Dispense Alternative",
              height: 30,
              backgroundColor: AppColors.white,
              onTap: onDespenseTap,
            ),
          ],
        ),
      ),
    );
  }
}
