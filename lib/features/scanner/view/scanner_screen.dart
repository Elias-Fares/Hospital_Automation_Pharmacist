import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/configuration/router/router.dart';
import 'package:medicare_pharmacy/core/constant/extra_keys.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
import 'package:medicare_pharmacy/features/scanner/view_model/scanner_view_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});
  static const routeName = "/scanner_screen";

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> with RouteAware {
  final MobileScannerController _mobileScannerController =
      MobileScannerController();

  // @override
  // void initState() {
  //   super.initState();
  // } // In your main.dart or app initialization

  // void initializeBarcodeScanner() async {
  //   try {
  //     // This will trigger the module download
  //     final scanner = BarcodeScanner();
  //     // Don't actually use it, just initialize
  //   } catch (e) {
  //     // Module is downloading, ignore the error
  //   }
  // }

  @override
  void didChangeDependencies() {
    //Called when the widget is inserted into the widget tree or when inherited widgets change.
    super.didChangeDependencies();

    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      AppRouter.routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    AppRouter.routeObserver.unsubscribe(this);
    _mobileScannerController.dispose();
    super.dispose();
  }

  // Called when this screen is pushed onto the stack and becomes visible.
  @override
  void didPush() {
    if (ref.watch(scannerViewModelProvider).isScannerVisible) {
      _mobileScannerController.start();
    }
  }

  //Called when another screen above this one is popped, and this screen is visible again.
  @override
  void didPopNext() {
    if (ref.watch(scannerViewModelProvider).isScannerVisible) {
      _mobileScannerController.start();
    }
  }

  //Called when a new screen is pushed on top of this one.
  @override
  void didPushNext() {
    _mobileScannerController.stop();
  }

  // Called when this screen is popped off the navigation stack
  @override
  void didPop() {
    _mobileScannerController.stop();
  }

  @override
  Widget build(BuildContext context) {
    final scannerState = ref.watch(scannerViewModelProvider);

    ref.listen(
      scannerViewModelProvider.select((value) => value.medicineResponse),
      (previous, next) => next?.when(
        data: (data) {
          context.push(
            Uri(
              path: MedicineDetailsScreen.routeName,
              queryParameters: {ExtraKeys.comingFromScanner: "true"},
            ).toString(),

            extra: data,
          );

          _mobileScannerController.stop();
        },
        error: (error, stackTrace) {
          _mobileScannerController.start();
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      ),
    );
    return scannerState.isScannerVisible
        ? Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: 1.sw,
              height: 1.sh,

              child: MobileScanner(
                controller: _mobileScannerController,
                onDetect: (result) async {
                  _mobileScannerController.pause();
                  // TODO remove after tetsing
                  // await ref
                  //     .read(scannerViewModelProvider.notifier)
                  //     .getMedicineByBarcode(code: "1234556");
                  await ref
                      .read(scannerViewModelProvider.notifier)
                      .getMedicineByBarcode(
                        code: result.barcodes.first.rawValue ?? "",
                      );
                },
              ),
            ),

            (scannerState.medicineResponse?.isLoading ?? false)
                ? Positioned.fill(
                  child: ColoredBox(
                    color: AppColors.onSurface.withValues(alpha: .6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                onPressed: () {
                  ref
                      .read(scannerViewModelProvider.notifier)
                      .toggleScannerVisibility();
                },
                icon: Icon(Icons.close),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        )
        : Column(
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
                    onTap: () async {
                      ref
                          .read(scannerViewModelProvider.notifier)
                          .toggleScannerVisibility();
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
