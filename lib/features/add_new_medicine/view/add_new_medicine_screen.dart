import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/cards/allownace_section.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/features/add_new_medicine/view_model/add_new_medicine_view_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'widget/image_section.dart';
part 'widget/scan_code_dialog.dart';

class AddNewMedicineScreen extends ConsumerStatefulWidget {
  const AddNewMedicineScreen({super.key});
  static const routeName = "/add_new_medicine_screen";

  @override
  ConsumerState<AddNewMedicineScreen> createState() =>
      _AddNewMedicineScreenState();
}

class _AddNewMedicineScreenState extends ConsumerState<AddNewMedicineScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titerController = TextEditingController();
  final TextEditingController phCompositionController = TextEditingController();
  final TextEditingController phIndicationController = TextEditingController();
  final TextEditingController lowBoundController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addNewMedicineViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSection(
                imagePath: "",
                onReplaceImageTap: () {
                  ref
                      .read(addNewMedicineViewModelProvider.notifier)
                      .pickImage();
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: nameController,
                style: Theme.of(context).textTheme.bodyMedium,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Medicine Name")),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: priceController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Price")),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: titerController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Titer")),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: quantityController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Quantity")),
              ),
              SizedBox(height: 20),
              AllownaceSection(
                isAllowedWithoutPrescription:
                    addState.isAllowedWithoutPrescription,

                onChanged: (value) {
                  ref
                      .read(addNewMedicineViewModelProvider.notifier)
                      .changeisAllowedWithoutPrescription(value);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: phCompositionController,
                style: Theme.of(context).textTheme.bodyMedium,
                minLines: 3,
                maxLines: 7,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(
                  label: Text("Pharmaceutical Composition"),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: phIndicationController,
                style: Theme.of(context).textTheme.bodyMedium,
                minLines: 3,
                maxLines: 7,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(
                  label: Text("Pharmaceutical Indications"),
                ),
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: lowBoundController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,

                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Low Bound")),
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: companyNameController,
                style: Theme.of(context).textTheme.bodyMedium,

                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Comapny Name")),
              ),
              SizedBox(height: 20),
              TextFormField(
                onTap: () {
                  ScanCodeDialog.builder(context, codeController: codeController);
                },
                controller: codeController,
                readOnly: true,

                style: Theme.of(context).textTheme.bodyMedium,

                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(
                  label: Text("Sacnned Code"),

                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 50,
                  ),

                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              LoadingButton(
                title: "Save Changes",
                isLoading: addState.addMedResponse?.isLoading ?? false,
                onTap: () async {
                  // ref
                  //     .read(editMedicineViewModelProvider.notifier)
                  //     .editMedicinesData(
                  //       medId: widget.med?.medicinesId?.toString() ?? "",
                  //       name: nameController.text,
                  //       pharmaceuticaltiter: titerController.text,
                  //       pharmaceuticalindications:
                  //           phIndicationController.text,
                  //       pharmaceuticalcomposition:
                  //           phCompositionController.text,
                  //       companyName: companyController.text,
                  //       price: priceController.text,
                  //     );
                },
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
