part of '../add_new_medicine_screen.dart';

class ScanCodeDialog extends ConsumerStatefulWidget {
  const ScanCodeDialog({super.key, required this.codeController});
  final TextEditingController codeController;

  static builder(
    BuildContext context, {
    required TextEditingController codeController,
  }) {
    showDialog(
      context: context,
      builder: (context) => ScanCodeDialog(codeController: codeController),
    );
  }

  @override
  ConsumerState<ScanCodeDialog> createState() => _ScanCodeDialogState();
}

class _ScanCodeDialogState extends ConsumerState<ScanCodeDialog> {
  final TextEditingController newQuantityController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: AppColors.backgroundColor,

      child: Container(
        padding: EdgeInsets.all(16),
        // height: 350,
        child: Form(
          key: _formKey,
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
              SizedBox(height: 8),
              Text(
                "You can scan medicine barcodes effortlessly—no laptop or hardware scanner required.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
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
                    widget.codeController.text =
                        result.barcodes.first.rawValue ?? "";
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
