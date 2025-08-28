part of '../edit_profile_screen.dart';

class EditProfileTextFormField extends StatelessWidget {
  const EditProfileTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.iconData,
    this.keyboardType,
  });

  final TextEditingController? textEditingController;
  final String label;
  final IconData? iconData;

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          controller: textEditingController,
        
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
    label: Text(label),
          ),
        );
  }
}
