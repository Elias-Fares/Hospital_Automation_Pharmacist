part of '../medicines_screen.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    super.key,
    required this.imageUrl,
    required this.medName,
    required this.medTiter,
    required this.medPrice,
  });

  final String imageUrl;
  final String medName;
  final String medTiter;
  final String medPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
