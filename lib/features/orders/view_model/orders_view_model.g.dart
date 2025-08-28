// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(OrdersViewModel)
const ordersViewModelProvider = OrdersViewModelProvider._();

final class OrdersViewModelProvider
    extends $NotifierProvider<OrdersViewModel, OrdersState> {
  const OrdersViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersViewModelHash();

  @$internal
  @override
  OrdersViewModel create() => OrdersViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersState>(value),
    );
  }
}

String _$ordersViewModelHash() => r'e75a643c03bcc4085aca7edcecc001a1e93ad9e0';

abstract class _$OrdersViewModel extends $Notifier<OrdersState> {
  OrdersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrdersState, OrdersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrdersState, OrdersState>,
              OrdersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
