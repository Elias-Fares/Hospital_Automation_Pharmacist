import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../configuration/res.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/general_image_asset.dart';
import 'auth_text_form_field.dart';
import 'email_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  final FormFieldValidator<String>? passwordValidator;

  final TextEditingController? passwordTextEditingController;
  final VoidCallback onSubmit;

  final bool isLoading;

  final GlobalKey<FormState> formKey;

  const ResetPasswordPage({
    super.key,
    this.passwordValidator,
    this.passwordTextEditingController,
    required this.onSubmit,
    required this.isLoading,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GeneralImageAssets(
                path: Res.loginImage,
                width: 120.r,
                height: 120.r,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Reset your password",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Set a new password for you account",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              const EmailWidget(
                email: "test@test.com",
                imgPath: Res.personePlaceHolderImage,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextFormField(
                textEditingController: passwordTextEditingController,
                validator: passwordValidator,
                label: "New Password*",
              ),
              const SizedBox(
                height: 30,
              ),
              LoadingButton(
                title: "Submit",
                isLoading: isLoading,
                onTap: onSubmit,
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }
}
