part of '../pharmacy_profile_screen.dart';

class PharmacyProfileNavigationSection extends StatelessWidget {
  const PharmacyProfileNavigationSection({
    super.key,
    required this.onPrescriptionTap,
    required this.onMedicinesTap,
    required this.onContractHistortTap,
  });

  final void Function() onPrescriptionTap;
  final void Function() onMedicinesTap;
  final void Function() onContractHistortTap;

  //TODO fix the icons here

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          // IconTitleNavigationButton(
          //   iconPath: Res.appointmenProfiletIcon,
          //   title: "Filled Prescriptions",
          //   onTap: onPrescriptionTap,
          // ),
          IconTitleNavigationButton(
            iconPath: Res.prescriptionsIcon,
            title: "Medicines",
            onTap: onContractHistortTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.recordIcon,
            title: "Contract History",
            onTap: onMedicinesTap,
          ),
        ],
      ),
    );
  }
}
