import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/add_residential_address_screen.dart'
    show AddResidentialAddressScreen;

class SuccessfulVerificationScreen extends ConsumerStatefulWidget {
  const SuccessfulVerificationScreen({super.key});
  static const routeName = "/successful_verification_screen";

  @override
  ConsumerState<SuccessfulVerificationScreen> createState() =>
      _SuccessfulVerificationScreenState();
}

class _SuccessfulVerificationScreenState
    extends ConsumerState<SuccessfulVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: containerCardDecoration(),
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GeneralImageAssets(
                        path: Res.successfulVerification,
                        width: 120,
                        height: 120,
                        boxFit: BoxFit.contain,
                      ),
                      Icon(Icons.check, color: AppColors.white),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Verified",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your email has been successfully verified",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 24),
                  LoadingButton(
                    title: "Next",
                    onTap: () {
                      context.push(AddResidentialAddressScreen.routeName);
                    },
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
            SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }
}
