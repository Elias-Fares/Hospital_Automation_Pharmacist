import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/entities/medicine_sale.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'specify_sale_amount_state.dart';
part 'specify_sale_amount_view_model.g.dart';

@Riverpod(keepAlive: true)
class SpecifySaleAmountViewModel extends _$SpecifySaleAmountViewModel {
  @override
  SpecifySaleAmountState build() {
    return SpecifySaleAmountState(medicines: [], totalPrice: 0);
  }

  final _repository = getIt<Repository>();

  void _updateTotalPrice() {
    final totalPrice = state.medicines.fold<int>(0, (sum, item) {
      debugPrint(
        "Quantity ${item.quantity} Name: ${item.medicineModel.name} Price: ${item.medicineModel.price}",
      );
      return sum + (item.quantity * (item.medicineModel.price ?? 0));
    });

    state = state.copyWith(totalPrice: totalPrice);
  }

  void addMedicineOrder({required MedicineModel? medicineModel}) {
    if (medicineModel == null) {
      return;
    }
    final medicineOrder = MedicineOrder(
      medicineModel: medicineModel,
      quantity: 1,
    );

    state = state.copyWith(medicines: [...state.medicines, medicineOrder]);

    _updateTotalPrice();
  }

  void setQuantity({
    required int newQuantity,
    required int medicineOrderIndex,
  }) {
    final medicinesOrderCopy = List<MedicineOrder>.from(state.medicines);
    final targetedOrder = medicinesOrderCopy.elementAt(medicineOrderIndex);

    if (newQuantity > 0) {
      final updatedMedicineOrder = targetedOrder.copyWith(
        quantity: newQuantity,
      );

      medicinesOrderCopy[medicineOrderIndex] = updatedMedicineOrder;
    } else {
      medicinesOrderCopy.removeAt(medicineOrderIndex);
    }

    state = state.copyWith(medicines: medicinesOrderCopy);

    _updateTotalPrice();
  }

  Future<void> sellRequest() async {
    if (state.medicines.isEmpty) {
      debugPrint("debugger saild it is empty");
      return;
    }

    state = state.copyWith(sellingResponse: AsyncValue.loading());

    final response = await _repository.saleProcessAmount(
      medicineIds:
          state.medicines
              .map((e) => e.medicineModel.medicinesId?.toString() ?? "")
              .toList(),
      ammountIds: state.medicines.map((e) => e.quantity).toList(),
      state: "addOrder",
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        sellingResponse: AsyncValue.data(response.data),
        totalPrice: 0,
        medicines: [],
      );
    } else {
      state = state.copyWith(
        sellingResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> fetchMedicineByBarcode({required String code}) async {
    if (code.isEmpty) {
      return;
    }
    state = state.copyWith(fetchMedicineResponse: AsyncValue.loading());
    final response = await _repository.getMedicineDetailsByBarcode(
      barcode: code,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        fetchMedicineResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        fetchMedicineResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
