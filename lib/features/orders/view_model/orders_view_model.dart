import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/order_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'orders_state.dart';
part 'orders_view_model.g.dart';

@riverpod
class OrdersViewModel extends _$OrdersViewModel {
  @override
  OrdersState build() => OrdersState();

  final _repository = getIt<Repository>();

  Future<void> getOrders() async {
    state = state.copyWith(ordersResponse: AsyncValue.loading());
    final response = await _repository.showOrders();

    if (response is DataSuccess) {
      state = state.copyWith(ordersResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        ordersResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
