import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/cards/allownace_section.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_text_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/edit_medicine/view_model/edit_medicine_view_model.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/medicine_details/view_model/medicine_details_view_model.dart';
import 'package:medicare_pharmacy/features/medicines/view_model/medicines_view_model.dart';

part 'widget/batches_section.dart';
part 'widget/image_section.dart';

class EditMedicineScreen extends ConsumerStatefulWidget {
  const EditMedicineScreen({super.key, required this.med});
  static const routeName = "/edit_medicine_screen";
  final MedicineModel? med;

  @override
  ConsumerState<EditMedicineScreen> createState() => _EditMedicineScreenState();
}

class _EditMedicineScreenState extends ConsumerState<EditMedicineScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController titerController;
  late TextEditingController phCompositionController;
  late TextEditingController phIndicationController;
  late TextEditingController lowBoundController;
  late TextEditingController companyController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.med?.name);
    priceController = TextEditingController(
      text: widget.med?.price?.toString(),
    );
    titerController = TextEditingController(
      text: widget.med?.pharmaceuticalTiter?.toString(),
    );
    phCompositionController = TextEditingController(
      text: widget.med?.pharmaceuticalComposition,
    );
    phIndicationController = TextEditingController(
      text: widget.med?.pharmaceuticalIndications,
    );
    lowBoundController = TextEditingController(
      text: widget.med?.pharmacyMedicines?.first.lowbound?.toString() ?? "",
    );
    companyController = TextEditingController(text: widget.med?.companyName);

    Future.microtask(() {
      ref
          .read(editMedicineViewModelProvider.notifier)
          .changeisAllowedWithoutPrescription(
            widget.med?.isAllowedWithoutPrescription ?? false,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(editMedicineViewModelProvider);

    ref.listen(
      editMedicineViewModelProvider.select((value) => value.editMedResponse),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(
              context,
              message: "The Medicine Edited Successfully",
            );
            Navigator.of(
              context,
            ).popUntil((route) => route.settings.name == MainScreen.routeName);

            ref.read(medicinesViewModelProvider.notifier).getMedicines();
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
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
                imageUrl: "${Constant.baseUrl}/${widget.med?.medImageUrl}",
                imagePath: editState.imagePath ?? "",
                onReplaceImageTap: () {
                  ref.read(editMedicineViewModelProvider.notifier).pickImage();
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
                controller: lowBoundController,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        FieldsValidator.validateEmpty(value: value ?? ""),
                decoration: InputDecoration(label: Text("Low Bound")),
              ),
              SizedBox(height: 20),
              AllownaceSection(
                isAllowedWithoutPrescription:
                    editState.isAllowedWithoutPrescription,

                onChanged: (value) {
                  ref
                      .read(editMedicineViewModelProvider.notifier)
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

              // BatchesSection(),
              // SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      title: "Discard Changes",
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ),

                  SizedBox(width: 8),
                  Expanded(
                    child: LoadingButton(
                      title: "Save Changes",
                      isLoading: editState.editMedResponse?.isLoading ?? false,
                      onTap: () async {
                        ref
                            .read(editMedicineViewModelProvider.notifier)
                            .editMedicinesData(
                              medId: widget.med?.medicinesId?.toString() ?? "",
                              name: nameController.text,
                              pharmaceuticaltiter: titerController.text,
                              pharmaceuticalindications:
                                  phIndicationController.text,
                              pharmaceuticalcomposition:
                                  phCompositionController.text,
                              companyName: companyController.text,
                              price: priceController.text,
                              lowBound: lowBoundController.text,
                            );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
