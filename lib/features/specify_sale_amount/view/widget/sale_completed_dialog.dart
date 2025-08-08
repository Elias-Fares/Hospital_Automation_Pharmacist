part of '../specify_sale_amount_screen.dart';

class SaleCompletedDialog extends StatefulWidget {
  const SaleCompletedDialog({super.key});

  static builder(BuildContext context) {
    showDialog(context: context, builder: (context) => SaleCompletedDialog());
  }

  @override
  State<SaleCompletedDialog> createState() => _SaleCompletedDialogState();
}

class _SaleCompletedDialogState extends State<SaleCompletedDialog> {
  final TextEditingController newQuantityController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: AppColors.backgroundColor,

      child: Container(
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
              "Sale Process Completed",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8),
            Text(
              "Receipt: 22 500 S.P",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    title: "New Sale",
                    backgroundColor: AppColors.white,
                    onTap: () {
                      // context.pushReplacement(MainScreen.routeName);
                      // Navigator.of(context).popUntil();
                      // context.go(MainScreen.routeName);
                      // GoRouter.of(context).pop
                      Navigator.of(context).popUntil(
                        (route) => route.settings.name == MainScreen.routeName,
                      );
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(child: LoadingButton(title: "Add more")),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
