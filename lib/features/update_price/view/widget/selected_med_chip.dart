part of '../update_price_screen.dart';

class SelectedMedChip extends StatelessWidget {
  const SelectedMedChip({super.key, required this.medName, this.onDeleteTap});
  final String medName;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsetsDirectional.only(end: 6),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primaryContainer,
      ),
      child: Row(
        children: [
          SizedBox(width: 5),
          Text(medName),

          IconButton(
            onPressed: onDeleteTap,
            icon: Icon(Icons.close_rounded, size: 15),
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
        ],
      ),
    );
  }
}
