// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(InventoryViewModel)
const inventoryViewModelProvider = InventoryViewModelProvider._();

final class InventoryViewModelProvider
    extends $NotifierProvider<InventoryViewModel, InventoryState> {
  const InventoryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryViewModelHash();

  @$internal
  @override
  InventoryViewModel create() => InventoryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryState>(value),
    );
  }
}

String _$inventoryViewModelHash() =>
    r'c77f5b95b1e70da555d40d58ba3a470a5049a079';

abstract class _$InventoryViewModel extends $Notifier<InventoryState> {
  InventoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<InventoryState, InventoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InventoryState, InventoryState>,
              InventoryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
