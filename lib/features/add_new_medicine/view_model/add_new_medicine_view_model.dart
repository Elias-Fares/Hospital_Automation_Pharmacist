import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/function/check_storage_permission.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_new_medicine_state.dart';
part 'add_new_medicine_view_model.g.dart';

@riverpod
class AddNewMedicineViewModel extends _$AddNewMedicineViewModel {
  @override
  AddNewMedicineState build() =>
      AddNewMedicineState(isAllowedWithoutPrescription: false);

  final _repository = getIt<Repository>();

  Future<void> addMedicine({
    required String name,
    required String pharmaceuticaltiter,
    required String pharmaceuticalindications,
    required String pharmaceuticalcomposition,
    required String companyName,
    required String price,
    required String quantity,
    required String lowBound,
    required String barcode,
    required String expiredAt,
  }) async {
    state = state.copyWith(addMedResponse: AsyncValue.loading());
    debugPrint(state.imagePath);
    final response = await _repository.addMedicine(
      name: name,
      pharmaceuticaltiter: pharmaceuticaltiter,
      pharmaceuticalindications: pharmaceuticalindications,
      pharmaceuticalcomposition: pharmaceuticalcomposition,
      companyName: companyName,
      price: price,
      imagePath: state.imagePath ?? "",
      quantity: quantity,
      lowBound: lowBound,
      barcode: barcode,
      expiredAt: expiredAt,
      isallowedwithoutprescription: state.isAllowedWithoutPrescription,
    );

    if (response is DataSuccess) {
      state = state.copyWith(addMedResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        addMedResponse: AsyncValue.error(
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
