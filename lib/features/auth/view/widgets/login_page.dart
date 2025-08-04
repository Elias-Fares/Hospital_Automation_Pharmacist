import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../configuration/res.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/buttons/custom_text_button.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/general_image_asset.dart';
import 'auth_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final VoidCallback loginFunc;
  final VoidCallback forgotPasswordFunc;
  final VoidCallback creatAccountFunc;
  final List<Widget> socialChildren;
  final Axis socialChildrenDirection;
  final MainAxisAlignment socialChildrenMinAxisAlignment;
  final MainAxisSize socialChildrenMainAxisSize;
  final CrossAxisAlignment socialChildrenCrossAxisAlignment;
  final bool isLoading;

  final GlobalKey<FormState> formKey;

  const LoginPage({
    super.key,
    this.emailValidator,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.loginFunc,
    required this.forgotPasswordFunc,
    required this.creatAccountFunc,
    required this.isLoading,
    required this.formKey,
    this.socialChildren = const <Widget>[],
    this.socialChildrenDirection = Axis.horizontal,
    this.socialChildrenMinAxisAlignment = MainAxisAlignment.center,
    this.socialChildrenMainAxisSize = MainAxisSize.max,
    this.socialChildrenCrossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Sign Up", style: Theme.of(context).textTheme.titleLarge,),
              // SizedBox(height: 30,),
              // AuthTextFormField(textEditingController: , validator: validator, hintText: hintText, iconData: iconData),
              SizedBox(
                height: 100.h,
              ),
              GeneralImageAssets(
                path: Res.loginImage,
                width: 120.r,
                height: 120.r,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Welcome Back!",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Sign in to access your work tasks",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextFormField(
                textEditingController: emailTextEditingController,
                validator: emailValidator,
                label: "Email Address",
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                  textEditingController: passwordTextEditingController,
                  validator: passwordValidator,
                  label: "Password",
                  isPassword: true),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CustomTextButton(
                  onTap: forgotPasswordFunc,
                  text: "Forgot Password?",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.hintTextColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              LoadingButton(
                title: "Login",
                isLoading: isLoading,
                onTap: loginFunc,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account?"),
                  CustomTextButton(
                      text: "Sign Up here",
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.primary,
                      onTap: creatAccountFunc)
                ],
              ),

              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
