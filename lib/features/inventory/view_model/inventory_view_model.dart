import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'inventory_state.dart';
part 'inventory_view_model.g.dart';

@riverpod
class InventoryViewModel extends _$InventoryViewModel {
  @override
  InventoryState build() => InventoryState();

}

