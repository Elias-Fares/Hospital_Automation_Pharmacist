part of '../batches_screen.dart';

class AddBatchDialog extends ConsumerStatefulWidget {
  const AddBatchDialog({super.key, required this.medicineId});
  final int? medicineId;

  static builder(BuildContext context, {required int? medicineId}) {
    showDialog(
      context: context,
      builder: (context) => AddBatchDialog(medicineId: medicineId),
    );
  }

  @override
  ConsumerState<AddBatchDialog> createState() => _AddBatchDialogState();
}

class _AddBatchDialogState extends ConsumerState<AddBatchDialog> {
  final TextEditingController newQuantityController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isAddBatchLoading = ref.watch(
      batchesViewModelProvider.select(
        (value) => value.addBatchResponse?.isLoading,
      ),
    );

    ref.listen(
      batchesViewModelProvider.select((value) => value.addBatchResponse),
      (previous, next) {
        next?.when(
          data: (data) => context.pop(),
          error:
              (error, stackTrace) =>
                  showSnackBarErrorMessage(context, message: error.toString()),
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
        child: Form(
          key: _formKey,
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
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
              ),
              SizedBox(height: 20),
              TextFieldDatePicker(
                textEditingController: expirationDateController,
                hintText: "Expiration Date",

                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(label: Text("Expiration Date")),
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
              ),

              Spacer(),

              CustomOutlinedButton(
                title: "Add Batch",
                backgroundColor: AppColors.white,
                isLoading: isAddBatchLoading ?? false,
                onTap: () {
                  if (!(_formKey.currentState?.validate() ?? false)) {
                    return;
                  }
                  ref
                      .read(batchesViewModelProvider.notifier)
                      .addBatch(
                        quantity: newQuantityController.text,
                        expiredDate: expirationDateController.text,
                        medId: widget.medicineId?.toString(),
                      );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
