import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodeDialog extends ConsumerStatefulWidget {
  const ScanCodeDialog({super.key, });


  static Future<String?> builder(
    BuildContext context, 

 ) async {
    final scannedCode = await showDialog<String>(
      context: context,
      builder: (context) => ScanCodeDialog(),
    );

    return scannedCode;
  }

  @override
  ConsumerState<ScanCodeDialog> createState() => _ScanCodeDialogState();
}

class _ScanCodeDialogState extends ConsumerState<ScanCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: AppColors.backgroundColor,

      child: Container(
        padding: EdgeInsets.all(16),
        // height: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              "Barcode Scanner",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),

            SizedBox(height: 30),
            Container(
              width: 1.sw,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              child: MobileScanner(
                // controller: _mobileScannerController,

                // scanWindow: Rect.fromCenter(
                //   center: Offset(1.sw / 2, 1.sh / 2),
                //   width: 100,
                //   height: 100,
                // ),
                onDetect: (result) {
                  // context.push(MedicineDetailsScreen.routeName);

                  context.pop(result.barcodes.first.rawValue ?? "");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
