part of'../medicine_details_screen.dart';
class MedicineDetailsNavigationSection extends StatelessWidget {
  const MedicineDetailsNavigationSection({
    super.key,
    required this.onEditMedicineDetailsTap,
    required this.onAlternativeTap,
    required this.onAddBatchTap,
    required this.onDeleteMedTap,
  });

  final void Function() onEditMedicineDetailsTap;
  final void Function() onAlternativeTap;
  final void Function() onAddBatchTap;
  final void Function() onDeleteMedTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          IconTitleNavigationButton(
            iconPath: Res.drawerMedicineIcon,
            title: "Edit medicine details",
            onTap: onEditMedicineDetailsTap,
          ),
          // IconTitleNavigationButton(
          //   iconPath: Res.batchIcon,
          //   title: "Medicine batches",
          //   onTap: onAddBatchTap,
          // ),
          IconTitleNavigationButton(
            iconPath: Res.alternativeIcon,
            title: "Alternatives",
            onTap: onAlternativeTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.trashIcon,
            title: "Delete medicine",
            onTap: onDeleteMedTap,
            textColor: AppColors.error,
          ),
        ],
      ),
    );
  }
}

