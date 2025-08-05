import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'orders_state.dart';
part 'orders_view_model.g.dart';

@riverpod
class OrdersViewModel extends _$OrdersViewModel {
  @override
  OrdersState build() => OrdersState();

}

