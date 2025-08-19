part of 'orders_view_model.dart';


class OrdersState {
  final AsyncValue<List<OrderModel>>? ordersResponse;

  OrdersState({this.ordersResponse});

  OrdersState copyWith({AsyncValue<List<OrderModel>>? ordersResponse}) =>
      OrdersState(ordersResponse: ordersResponse ?? this.ordersResponse);
}
