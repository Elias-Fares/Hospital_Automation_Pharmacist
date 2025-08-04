import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});
  static const routeName = "/scanner_screen";

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: containerCardDecoration(),
          child: Column(
            children: [
              GeneralImageAssets(
                path: Res.barcodeIcon,
                width: 140,
                height: 140,
              ),
              SizedBox(height: 32),
              Text(
                "Barcode Scanner",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
              ),
              SizedBox(height: 8),
              Text(
                "You can scan medicine barcodes effortlessly—no laptop or hardware scanner required. Simply click the button below to get started.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              LoadingButton(
                title: "Scan",
                onTap: () {
                  // context.push(AddResidentialAddressScreen.routeName);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: kTextTabBarHeight),
      ],
    );
  }
}
