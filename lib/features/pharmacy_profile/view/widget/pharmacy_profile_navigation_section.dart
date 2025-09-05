part of '../pharmacy_profile_screen.dart';

class PharmacyProfileNavigationSection extends StatelessWidget {
  const PharmacyProfileNavigationSection({
    super.key,
    required this.onDeactivateTap,
    required this.onLogOutTap,
  });

  final void Function() onLogOutTap;
  final void Function() onDeactivateTap;

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
            iconPath: Res.logOutIcon,

            title: "Log out",
            onTap: onLogOutTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.suspendUserIcon,
            title: "Deactivate pharmacy",
            onTap: onDeactivateTap,
            textColor: AppColors.error,
          ),
        ],
      ),
    );
  }
}
