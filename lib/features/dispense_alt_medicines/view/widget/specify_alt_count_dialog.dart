part of '../dispense_alt_medicines_screen.dart';

class SpecifyAltCountDialog extends ConsumerStatefulWidget {
  const SpecifyAltCountDialog({
    super.key,
    required this.pharmacyMedicineId,
    required this.altMedicineId,
  });

  final int? pharmacyMedicineId;
  final int? altMedicineId;

  static builder(
    BuildContext context, {
    required int? pharmacyMedicineId,
    required int? altMedicineId,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => SpecifyAltCountDialog(
            pharmacyMedicineId: pharmacyMedicineId,
            altMedicineId: altMedicineId,
          ),
    );
  }

  @override
  ConsumerState<SpecifyAltCountDialog> createState() =>
      _SpecifyAltCountDialogState();
}

class _SpecifyAltCountDialogState extends ConsumerState<SpecifyAltCountDialog> {
  final TextEditingController countController = TextEditingController();

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
                controller: countController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Amount")),
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
              ),
              SizedBox(height: 20),

              CustomOutlinedButton(
                title: "Dispense",
                backgroundColor: AppColors.white,
                isLoading: false,
                onTap: () {
                  if (!(_formKey.currentState?.validate() ?? false)) {
                    return;
                  }
                  ref
                      .read(dispenseAltMedicinesViewModelProvider.notifier)
                      .markAsDispenced(
                        originalMedicine:
                            widget.pharmacyMedicineId?.toString() ?? "",
                        alternativeMedicine:
                            widget.altMedicineId?.toString() ?? "",
                        count: int.tryParse(countController.text) ?? 0,
                      );

                  context.pop();
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
