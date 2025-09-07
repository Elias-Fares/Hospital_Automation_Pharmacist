part of "../specify_sale_amount_screen.dart";

class SpecifySaleAmountDialog extends ConsumerStatefulWidget {
  const SpecifySaleAmountDialog({super.key});

  static Future<int?> builder(BuildContext context) async {
    final quantity = await showDialog<int>(
      context: context,
      builder: (context) => SpecifySaleAmountDialog(),
    );

    return quantity;
  }

  @override
  ConsumerState<SpecifySaleAmountDialog> createState() =>
      _SpecifySaleAmountDialogState();
}

class _SpecifySaleAmountDialogState
    extends ConsumerState<SpecifySaleAmountDialog> {
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

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                "Specify Sale Amount",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              Text(
                "This action updates stock levels and sales records.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: newQuantityController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(label: Text("Quantity")),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
              ),
              SizedBox(height: 20),

              CustomOutlinedButton(
                title: "Confirm",
                backgroundColor: AppColors.white,

                onTap: () {
                  if (!(_formKey.currentState?.validate() ?? false)) {
                    return;
                  }

                  final quantity = int.tryParse(newQuantityController.text);

                  context.pop(quantity);
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
