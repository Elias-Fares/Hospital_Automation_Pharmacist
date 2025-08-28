import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/entities/medicine_sale.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'specify_sale_amount_state.dart';
part 'specify_sale_amount_view_model.g.dart';

@Riverpod(keepAlive: true)
class SpecifySaleAmountViewModel extends _$SpecifySaleAmountViewModel {
  @override
  SpecifySaleAmountState build() {
    return SpecifySaleAmountState();
  }

  final _repository = getIt<Repository>();

  final List<MedicineSale> _medicinesSale = [];

  void addMedicineSale({
    required String medicineId,
    required double unitPrice,
    required int quantity,
  }) {
    final index = _medicinesSale.indexWhere((m) => m.medicineId == medicineId);

    final newMedicineSale = MedicineSale(
      medicineId: medicineId,
      unitPrice: unitPrice,
      quantity: quantity,
    );

    if (index != -1) {
      _medicinesSale[index] = newMedicineSale;
    } else {
      _medicinesSale.add(newMedicineSale);
    }

    debugPrint("debugger ${_medicinesSale.toString()}");
  }

  void reset() {
    _medicinesSale.clear();
  }

  double getPrice() {
    double price = 0;
    for (var element in _medicinesSale) {
      price = (price + (element.unitPrice * element.quantity));
    }
    return price;
  }

  Future<void> sellRequest() async {
    if (_medicinesSale.isEmpty) {
      debugPrint("debugger saild it is empty");
      return;
    }

    state = state.copyWith(sellingResponse: AsyncValue.loading());

    final response = await _repository.saleProcessAmount(
      medicineIds: _medicinesSale.map((e) => e.medicineId).toList(),
      ammountIds: _medicinesSale.map((e) => e.quantity).toList(),
      state: "addOrder",
    );

    if (response is DataSuccess) {
      state = state.copyWith(sellingResponse: AsyncValue.data(response.data));
      reset();
    } else {
      state = state.copyWith(
        sellingResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
