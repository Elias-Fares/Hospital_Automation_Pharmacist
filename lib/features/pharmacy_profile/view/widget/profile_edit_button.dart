part of '../pharmacy_profile_screen.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.secondaryContainer,
      child: const GeneralImageAssets(
        path: Res.editPenIcon,
        width: 24,
        height: 24,
        boxFit: BoxFit.contain,
        color: AppColors.greenText,
      ),
    );
  }
}
