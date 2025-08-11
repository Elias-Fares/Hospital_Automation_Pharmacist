part of '../alternative_medicines_screen.dart';

class AlternativeMedicineCard extends StatelessWidget {
  const AlternativeMedicineCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
    this.onMedicineTap,
    this.onDetachTap, required this.isLoading,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;
  final bool isLoading;
  final void Function()? onMedicineTap;
  final void Function()? onDetachTap;

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
              title: "Detach",
              height: 30,
              isLoading: isLoading,
              loadingIndicatorSize: 15,

              onTap: onDetachTap,
            ),
          ],
        ),
      ),
    );
  }
}
