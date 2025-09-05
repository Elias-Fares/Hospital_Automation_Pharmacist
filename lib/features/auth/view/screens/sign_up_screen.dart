import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/validators/fields_validator.dart';
import '../../../../core/widgets/show_snack_bar_error_message.dart';
import 'login_screen.dart';
import 'verification_code_screen.dart';
import '../widgets/sign_up_page.dart';
import '../../view_models/sign_up/sign_up_view_model.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const routeName = "/sign_up_screen";

  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController middleNameTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    middleNameTextEditingController.dispose();
    phoneTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpValue = ref.watch(signUpViewModelProvider);

    ref.listen(
      signUpViewModelProvider.select((value) => value.signUpResponse),
      (_, next) {
        next?.when(
          data: (data) {
            context.push(VerificationCodeScreen.routeName);
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: SignupPage(
          emailTextEditingController: emailTextEditingController,
          passwordTextEditingController: passwordTextEditingController,
          confirmPasswordTextEditingController:
              confirmPasswordTextEditingController,
          firstNameTextEditingController: firstNameTextEditingController,
          lastNameTextEditingController: lastNameTextEditingController,
          phoneNumberTextEditingController: phoneTextEditingController,
          middleNameTextEditingController: middleNameTextEditingController,
          isLoading: signUpValue.signUpResponse?.isLoading ?? false,
          formKey: _formKey,
          emailValidator: (val) {
            return FieldsValidator.validateEmail(email: val ?? "");
          },

          //TODO add strong password validation
          passwordValidator: (val) {
            return FieldsValidator.validateEmpty(value: val ?? "");
          },
          confirmPassWordValidator: (val) {
            return FieldsValidator.matchPassword(
              value1: passwordTextEditingController.text,
              value2: confirmPasswordTextEditingController.text,
            );
          },
          firstNameValidator: (val) {
            return FieldsValidator.validateEmpty(value: val ?? "");
          },
          lastNameValidator: (val) {
            return FieldsValidator.validateEmpty(value: val ?? "");
          },
          middleNameValidator: (val) {
            return FieldsValidator.validateEmpty(value: val ?? "");
          },
          phoneNumberValidator: (val) {
            return FieldsValidator.validateEmpty(value: val ?? "");
          },
          selectedGender: signUpValue.selectedGender,
          onGenderSelect: (gender) {
            ref.read(signUpViewModelProvider.notifier).setGender(gender);
          },
          signUpFunc: () {
            // TODO delete after test
            // if (!(_formKey.currentState?.validate() ?? false)) {
            //   return;
            // }

            // ref.read(signUpViewModelProvider.notifier).signUp(
            //       email: emailTextEditingController.text,
            //       firstName: firstNameTextEditingController.text,
            //       lastName: lastNameTextEditingController.text,
            //       middleName: middleNameTextEditingController.text,
            //       password: passwordTextEditingController.text,
            //       phoneNumber: phoneTextEditingController.text,
            //     );
            context.push(VerificationCodeScreen.routeName);
          },
          goToLogin: () {
            context.go(LoginScreen.routeName);
          },
        ),
      ),
    );
  }
}
