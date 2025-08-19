import 'package:image_picker/image_picker.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/function/check_storage_permission.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'edit_medicine_state.dart';
part 'edit_medicine_view_model.g.dart';

@riverpod
class EditMedicineViewModel extends _$EditMedicineViewModel {
  @override
  EditMedicineState build() =>
      EditMedicineState(isAllowedWithoutPrescription: false);



  final _repository = getIt<Repository>();

  Future<void> editMedicinesData({
    required String medId,
    required String name,
    required String pharmaceuticaltiter,
    required String pharmaceuticalindications,
    required String pharmaceuticalcomposition,
    required String companyName,
    required String price,
    required String lowBound,
  }) async {
    state = state.copyWith(editMedResponse: AsyncValue.loading());
    final response = await _repository.updateMedicineDetails(
      medId: medId,
      name: name,
      pharmaceuticaltiter: pharmaceuticaltiter,
      pharmaceuticalindications: pharmaceuticalindications,
      pharmaceuticalcomposition: pharmaceuticalcomposition,
      companyName: companyName,
      price: price,
      isallowedwithoutprescription: state.isAllowedWithoutPrescription,
      lowbound: lowBound,
      imagePath: state.imagePath ?? "",
    );

    if (response is DataSuccess) {
      state = state.copyWith(editMedResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        editMedResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> pickImage() async {
    if (await checkStoragePermisson()) {
      final ImagePicker imagePicker = ImagePicker();
      final result = await imagePicker.pickImage(source: ImageSource.gallery);
      state = state.copyWith(imagePath: result?.path);
    } else {
      checkStoragePermisson();
    }
  }

    void changeisAllowedWithoutPrescription(bool value) {
    state = state.copyWith(isAllowedWithoutPrescription: value);
  }
}
