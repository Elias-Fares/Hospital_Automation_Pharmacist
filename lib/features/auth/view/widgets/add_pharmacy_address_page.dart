import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import 'auth_text_form_field.dart';

class AddPharmacyAddressPage extends StatelessWidget {
  final FormFieldValidator<String>? governateValidator;
  final FormFieldValidator<String>? cityValidator;
  final FormFieldValidator<String>? regionValidator;
  final FormFieldValidator<String>? streetValidator;
  final TextEditingController governateTextEditingController;
  final TextEditingController cityTextEditingController;
  final TextEditingController regionTextEditingController;
  final TextEditingController streetTextEditingController;
  final TextEditingController noteTextEditingController;

  final VoidCallback submit;

  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final bool isAgreeChecked;
  final void Function(bool?)? onCheckBoxChanged;
  const AddPharmacyAddressPage({
    super.key,
    required this.formKey,
    this.governateValidator,
    this.cityValidator,
    this.regionValidator,
    this.streetValidator,
    required this.governateTextEditingController,
    required this.cityTextEditingController,
    required this.regionTextEditingController,
    required this.streetTextEditingController,
    required this.noteTextEditingController,
    required this.submit,
    required this.isLoading,
    required this.isAgreeChecked,
    this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "Pharmacy Address",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // SizedBox(height: 30,),
            // AuthTextFormField(textEditingController: , validator: validator, hintText: hintText, iconData: iconData),
            const SizedBox(height: 30),

            AuthTextFormField(
              textEditingController: governateTextEditingController,
              validator: governateValidator,
              label: "Governate*",
            ),
            const SizedBox(height: 22),
            AuthTextFormField(
              textEditingController: cityTextEditingController,
              validator: cityValidator,
              label: "City*",
            ),
            const SizedBox(height: 22),
            AuthTextFormField(
              textEditingController: regionTextEditingController,
              validator: regionValidator,
              label: "Region",
            ),
            const SizedBox(height: 22),
            AuthTextFormField(
              textEditingController: streetTextEditingController,
              validator: streetValidator,
              label: "Street*",
            ),
            const SizedBox(height: 22),
            AuthTextFormField(
              textEditingController: noteTextEditingController,
              validator: null,
              label: "note",
            ),

            const SizedBox(height: 22),
            CheckboxListTile(
              value: isAgreeChecked,
              onChanged: onCheckBoxChanged,
              isThreeLine: true,
              title: const Text("I agree"),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              subtitle: const Text(
                "Pharmacy address will be used to make it easy for patients to reach you.",
              ),
            ),
            const SizedBox(height: 30),

            LoadingButton(title: "Submit", isLoading: isLoading, onTap: submit),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
