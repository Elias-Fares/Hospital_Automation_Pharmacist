import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.textEditingController,
    required this.validator,
    required this.label,
    this.iconData,
    this.isPassword = false,
    this.keyboardType,
  });

  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String label;
  final IconData? iconData;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 48.h,
        child: TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        label: Text(label),
      ),
    ));
  }
}
