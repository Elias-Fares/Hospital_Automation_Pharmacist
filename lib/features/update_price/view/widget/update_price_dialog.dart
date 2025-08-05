part of '../update_price_screen.dart';

class UpdatePriceDialog extends StatefulWidget {
  const UpdatePriceDialog({super.key});

  static builder(BuildContext context) {
    showDialog(context: context, builder: (context) => UpdatePriceDialog());
  }

  @override
  State<UpdatePriceDialog> createState() => _UpdatePriceDialogState();
}

class _UpdatePriceDialogState extends State<UpdatePriceDialog> {
  final TextEditingController percentageController = TextEditingController();

  Widget _buildElement({
    required bool condition,
    required String text,
    required IconData icon,
  }) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(8),
      decoration: containerCardDecoration().copyWith(
        color: condition ? AppColors.primaryContainer : AppColors.white,
        border: Border.all(
          color: condition ? AppColors.primary : AppColors.transparent,
        ),
      ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  condition: true,
                  text: "Up",
                  icon: Icons.arrow_upward,
                ),
                SizedBox(width: 15),
                _buildElement(
                  condition: false,
                  text: "Down",
                  icon: Icons.arrow_downward,
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: percentageController,

              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                label: Text("Percentage"),
                suffix: Text("%"),
              ),
            ),

            Spacer(),

            CustomOutlinedButton(title: "Update Price"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
