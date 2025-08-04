import 'package:flutter/material.dart';
import '../../../../core/validators/fields_validator.dart';
import '../widgets/reset_password_page.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/reset_password";

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ResetPasswordPage(
          formKey: formKey,
          isLoading: false,
          passwordTextEditingController: passwordTextEditingController,
          passwordValidator: (value) =>
              FieldsValidator.validateEmpty(value: value ?? ""),
          onSubmit: () {},
        ));
  }
}
