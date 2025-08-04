import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../configuration/res.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/buttons/custom_text_button.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/general_image_asset.dart';
import 'email_widget.dart';

class VerificationCodePage extends StatelessWidget {
  final FormFieldValidator<String>? verifyCodeValidator;
  final VoidCallback verifyCodePress;
  final VoidCallback resendCodePress;

  final GlobalKey<FormState> formKey;
  final bool? isLoading;
  // final void Function(String)? onCodeChanged;
  final void Function(String)? onSubmit;

  const VerificationCodePage(
      {super.key,
      required this.verifyCodeValidator,
      required this.verifyCodePress,
      required this.resendCodePress,
      required this.formKey,
      this.isLoading,
      // this.onCodeChanged
      this.onSubmit
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GeneralImageAssets(
                path: Res.verificationCodeImage,
                matchTextDirection: false,
                width: 115,
                height: 115,
              ),
              const SizedBox(height: 15),
              Text("Verify your email",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 12),
              Text(
                "Verification code sent to email",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              const EmailWidget(
                  email: "test@test.com", imgPath: Res.personePlaceHolderImage),
              const SizedBox(height: 30),
              OtpTextField(
                numberOfFields: 4,
                focusedBorderColor: AppColors.primary,
                contentPadding: const EdgeInsets.all(8),
                showFieldAsBox: true,
                borderRadius: BorderRadius.circular(8),
                decoration: const InputDecoration(
                    filled: true, fillColor: AppColors.white),
                borderWidth: 1,
                // onCodeChanged: onCodeChanged,
                // onSubmit: (value) {
                //   debugPrint("debugger$value");
                //   showSnackBarSuccessMessage(context, message: value);
                // },
                onSubmit: onSubmit,
              ),
              const SizedBox(height: 40),
              LoadingButton(
                title: "Submit",
                isLoading: isLoading,
                onTap: verifyCodePress,
              ),
              const SizedBox(height: 40),
              Text(
                "Didn’t get OTP verification code?",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.textColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              CustomTextButton(
                  text: "Resend Code",
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.textColor),
                  onTap: resendCodePress),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
