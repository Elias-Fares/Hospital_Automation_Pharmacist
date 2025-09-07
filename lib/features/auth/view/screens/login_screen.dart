import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/splash/view_model/splash_view_model.dart';
import '../../../../core/validators/fields_validator.dart';
import '../../../../core/widgets/show_snack_bar_error_message.dart';
// import '../../../appointments/view/appointments.dart';
import 'reset_password_screen.dart';
import 'sign_up_screen.dart';
import '../widgets/login_page.dart';
import '../../view_models/log_in/log_in_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login_screen";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenV2State();
}

class _LoginScreenV2State extends ConsumerState<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void initState() {
    super.initState();

    // Future.microtask(
    //   () {
    //     if (mounted) {
    //       ref.read(logInViewModelProvider.notifier).autoLogin(context: context);
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final val = ref.watch(authRiverpodProvider);
    // print(val.toString());

    final loginState = ref.watch(logInViewModelProvider);

    ref.listen(logInViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          // showSnackBarSuccessMessage(context, message: data["message"]);
          ref
              .read(logInViewModelProvider.notifier)
              .redirectionAfterLogin(context);
          // context.go(MainScreen.routeName);
        },
        error: (error, stackTrace) {
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      );
    });
    return Scaffold(
      body: LoginPage(
        emailTextEditingController: emailTextEditingController,
        passwordTextEditingController: passwordTextEditingController,
        isLoading: loginState?.isLoading ?? false,
        formKey: _formKey,
        emailValidator: (val) {
          return FieldsValidator.validateEmail(email: val ?? "");
        },
        //TODO implement strong password validation
        passwordValidator: (val) {
          return FieldsValidator.validateEmpty(value: val ?? "");
        },
        loginFunc: () {
          //TODO uncomment this when test finished
          if (!(_formKey.currentState?.validate() ?? false)) {
            return;
          }
          ref
              .read(logInViewModelProvider.notifier)
              .login(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text,
              );
        },
        creatAccountFunc: () {
          context.push(SignupScreen.routeName);
        },
        forgotPasswordFunc: () {
          context.push(ResetPasswordScreen.routeName);
        },
      ),
    );
  }
}
