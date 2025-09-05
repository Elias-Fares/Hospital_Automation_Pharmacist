import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/features/auth/view/widgets/add_pharmacy_address_page.dart';
import 'package:medicare_pharmacy/features/auth/view_models/add_pharmacy_address/add_pharmacy_address_view_model.dart';
import 'package:medicare_pharmacy/features/permission_required/view/permission_required_screen.dart';
import 'package:medicare_pharmacy/features/upload_documents/view/upload_documents_screen.dart';
import '../../../../core/validators/fields_validator.dart';
import '../../../../core/widgets/show_snack_bar_error_message.dart';
import 'upload_profile_image_screen.dart';
import '../widgets/add_residential_address_page.dart';
import '../../view_models/add_residential_address/add_residential_address_view_model.dart';

class AddPharmacyAddressScreen extends ConsumerStatefulWidget {
  static const routeName = "/add_pharmacy_address";

  const AddPharmacyAddressScreen({super.key});

  @override
  ConsumerState<AddPharmacyAddressScreen> createState() =>
      _AddPharmacyAddressScreenState();
}

class _AddPharmacyAddressScreenState
    extends ConsumerState<AddPharmacyAddressScreen> {
  final TextEditingController governateTextEditingController =
      TextEditingController();
  final TextEditingController cityTextEditingController =
      TextEditingController();
  final TextEditingController regionTextEditingController =
      TextEditingController();
  final TextEditingController streetTextEditingController =
      TextEditingController();
  final TextEditingController noteTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
    governateTextEditingController.dispose();
    cityTextEditingController.dispose();
    regionTextEditingController.dispose();

    streetTextEditingController.dispose();
    noteTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addPharmacyAddressState = ref.watch(
      addPharmacyAddressViewModelProvider,
    );

    ref.listen(
      addPharmacyAddressViewModelProvider.select(
        (value) => value.addAddressResponse,
      ),
      (_, next) {
        next?.when(
          data: (data) {
            context.push(UploadDocumentsScreen.routeName);
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
      appBar: AppBar(),
      body: AddPharmacyAddressPage(
        formKey: _formKey,
        governateTextEditingController: governateTextEditingController,
        cityTextEditingController: cityTextEditingController,
        regionTextEditingController: regionTextEditingController,
        streetTextEditingController: streetTextEditingController,
        noteTextEditingController: noteTextEditingController,
        isLoading:
            addPharmacyAddressState.addAddressResponse?.isLoading ?? false,
        isAgreeChecked: addPharmacyAddressState.agreeCheckBox,
        cityValidator:
            (value) => FieldsValidator.validateEmpty(value: value ?? ""),
        governateValidator:
            (value) => FieldsValidator.validateEmpty(value: value ?? ""),
        regionValidator:
            (value) => FieldsValidator.validateEmpty(value: value ?? ""),
        streetValidator:
            (value) => FieldsValidator.validateEmpty(value: value ?? ""),
        onCheckBoxChanged: (value) {
          ref
              .read(addPharmacyAddressViewModelProvider.notifier)
              .onCheckBoxChanged(value ?? false);
        },
        submit: () {
          if (!(_formKey.currentState?.validate() ?? false) ||
              (!addPharmacyAddressState.agreeCheckBox)) {
            return;
          }
          ref
              .read(addPharmacyAddressViewModelProvider.notifier)
              .addAddress(
                governate: governateTextEditingController.text,
                city: cityTextEditingController.text,
                region: regionTextEditingController.text,
                street: streetTextEditingController.text,
                note: noteTextEditingController.text,
              );

          // context.push(UploadDocumentsScreen.routeName);
        },
      ),
    );
  }
}
