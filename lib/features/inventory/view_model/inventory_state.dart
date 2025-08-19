part of 'inventory_view_model.dart';

class InventoryState {
  final AsyncValue<InventoryModel>? inventoryResponse;

  InventoryState({this.inventoryResponse});

  InventoryState copyWith({AsyncValue<InventoryModel>? inventoryResponse}) {
    return InventoryState(
      inventoryResponse: inventoryResponse ?? this.inventoryResponse,
    );
  }
}
