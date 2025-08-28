part of '../update_price_screen.dart';

class UpdatePriceDialog extends ConsumerStatefulWidget {
  const UpdatePriceDialog({super.key});

  static builder(BuildContext context) {
    showDialog(context: context, builder: (context) => UpdatePriceDialog());
  }

  @override
  ConsumerState<UpdatePriceDialog> createState() => _UpdatePriceDialogState();
}

class _UpdatePriceDialogState extends ConsumerState<UpdatePriceDialog> {
  final TextEditingController percentageController = TextEditingController();

  Widget _buildElement({
    required bool condition,
    required String text,
    required IconData icon,
    required void Function() onTap,
  }) {
    return CustomInkwell(
      onTap: onTap,
      color: condition ? AppColors.primaryContainer : AppColors.white,
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: condition ? AppColors.primary : AppColors.transparent,
      ),
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(8),

        child: Column(
          children: [
            Icon(icon, size: 16, color: AppColors.onPrimaryContainer),
            SizedBox(width: 8),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(updatePriceViewModelProvider);
    ref.listen(
      updatePriceViewModelProvider.select((value) => value.updatePriceResponse),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(
              context,
              message: "Prices Updated Successfully",
            );
            context.pop();
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: next.error.toString());
          },
          loading: () {},
        );
      },
    );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: AppColors.backgroundColor,
      child: Container(
        padding: EdgeInsets.all(16),
        height: 380,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Update Prices",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),
            Text(
              "Use the up and down buttons to set the direction of the price update.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                _buildElement(
                  condition: updateState.updateType == ParamsValues.up,
                  text: "Up",
                  icon: Icons.arrow_upward,
                  onTap: () {
                    ref
                        .read(updatePriceViewModelProvider.notifier)
                        .onUpdateTypeChanged(ParamsValues.up);
                  },
                ),
                SizedBox(width: 15),
                _buildElement(
                  condition: updateState.updateType == ParamsValues.down,
                  text: "Down",
                  icon: Icons.arrow_downward,
                  onTap: () {
                    ref
                        .read(updatePriceViewModelProvider.notifier)
                        .onUpdateTypeChanged(ParamsValues.down);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: percentageController,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                label: Text("Percentage"),
                suffix: Text("%"),
              ),
            ),

            Spacer(),

            CustomOutlinedButton(
              title: "Update Price",
              isLoading: updateState.updatePriceResponse?.isLoading ?? false,
              onTap: () {
                ref
                    .read(updatePriceViewModelProvider.notifier)
                    .updatePrice(
                      percentage:
                          double.tryParse(percentageController.text) ?? 0,
                    );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
