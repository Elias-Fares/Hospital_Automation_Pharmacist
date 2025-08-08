part of '../batches_screen.dart';

class AddBatchDialog extends StatefulWidget {
  const AddBatchDialog({super.key});

  static builder(BuildContext context) {
    showDialog(context: context, builder: (context) => AddBatchDialog());
  }

  @override
  State<AddBatchDialog> createState() => _AddBatchDialogState();
}

class _AddBatchDialogState extends State<AddBatchDialog> {
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
        padding: EdgeInsets.all(16),
        height: 380,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Add New Batch",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),
            Text(
              "The quantity you enter will be added to the current stock of the medicine.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: newQuantityController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(label: Text("New Quantity")),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: expirationDateController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(label: Text("Expiration Date")),
            ),

            Spacer(),

            CustomOutlinedButton(
              title: "Add Batch",
              backgroundColor: AppColors.white,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
