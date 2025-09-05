import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/features/successful_verification/view/successful_verification_screen.dart';
import '../../../../core/validators/fields_validator.dart';
import '../../../../core/widgets/show_snack_bar_error_message.dart';
import '../../../../core/widgets/show_snack_bar_success_message.dart';
import 'login_screen.dart';
import '../widgets/verification_code_page.dart';
import '../../view_models/verify_code/verify_code_view_model.dart';

class VerificationCodeScreen extends ConsumerStatefulWidget {
  static const routeName = "/verification_code_screen";

  const VerificationCodeScreen({super.key});

  @override
  ConsumerState<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends ConsumerState<VerificationCodeScreen> {
  String _otpCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ref.listenManual(
      verifyCodeViewModelProvider.select((value) => value.sendCodeResponse),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(context, message: data.toString());
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    ref.listenManual(
      verifyCodeViewModelProvider.select((value) => value.verifyCodeResponse),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(
              context,
              message: "Your Email Verified Successfully :)",
            );
            if (mounted) context.push(SuccessfulVerificationScreen.routeName);
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isVerifyLoading =
        ref.watch(verifyCodeViewModelProvider).verifyCodeResponse?.isLoading ??
        false;

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: VerificationCodePage(
        formKey: formKey,
        isLoading: isVerifyLoading,
        email: ref.read(verifyCodeViewModelProvider.notifier).getEmail(),
        verifyCodeValidator: (value) {
          return FieldsValidator.validateEmpty(value: value ?? "");
        },
        onSubmit: (value) {
          _otpCode = value;

          debugPrint(_otpCode);
        },
        verifyCodePress: () {
          //TODO uncomment when you finish Auth
          debugPrint(_otpCode.length.toString());
          if (_otpCode.length < 4) {
            return;
          }
          ref
              .read(verifyCodeViewModelProvider.notifier)
              .verifyOTP(otp: _otpCode);

          //TODO delete it when u fininsh testign
          // context.push(SuccessfulVerificationScreen.routeName);
        },
        resendCodePress: () {
          ref.read(verifyCodeViewModelProvider.notifier).sendOTP();
        },
      ),
    );
  }
}
