part of '../update_price_screen.dart';

class UpdateMedCard extends StatelessWidget {
  const UpdateMedCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
    this.onMedicineTap,
    required this.isSelected,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;
  final bool isSelected;
  final void Function()? onMedicineTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onMedicineTap,
      color: containerCardDecoration().color,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: containerCardDecoration().copyWith(
          color: AppColors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
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

                Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected
                              ? AppColors.transparent
                              : AppColors.outline,
                    ),
                    color: isSelected ? AppColors.primaryText : AppColors.white,
                  ),

                  child:
                      isSelected
                          ? Icon(Icons.check, color: AppColors.white, size: 12)
                          : SizedBox.shrink(),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
