import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/inventory_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'inventory_state.dart';
part 'inventory_view_model.g.dart';

@riverpod
class InventoryViewModel extends _$InventoryViewModel {
  @override
  InventoryState build() => InventoryState();

    final _repository = getIt<Repository>();

  Future<void> getInventory() async {
    state = state.copyWith(inventoryResponse: AsyncValue.loading());
    final response = await _repository.dailyInventory();

    if (response is DataSuccess) {
      state = state.copyWith(inventoryResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        inventoryResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

}

