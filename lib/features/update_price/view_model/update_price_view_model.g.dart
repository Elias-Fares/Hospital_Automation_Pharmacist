// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_price_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UpdatePriceViewModel)
const updatePriceViewModelProvider = UpdatePriceViewModelProvider._();

final class UpdatePriceViewModelProvider
    extends $NotifierProvider<UpdatePriceViewModel, UpdatePriceState> {
  const UpdatePriceViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePriceViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePriceViewModelHash();

  @$internal
  @override
  UpdatePriceViewModel create() => UpdatePriceViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdatePriceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdatePriceState>(value),
    );
  }
}

String _$updatePriceViewModelHash() =>
    r'152df98180e7be94d6cf7ef5067ead40d9ba60b0';

abstract class _$UpdatePriceViewModel extends $Notifier<UpdatePriceState> {
  UpdatePriceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UpdatePriceState, UpdatePriceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UpdatePriceState, UpdatePriceState>,
              UpdatePriceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
