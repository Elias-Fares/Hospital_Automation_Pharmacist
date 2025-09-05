// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_pharmacy_address_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddPharmacyAddressViewModel)
const addPharmacyAddressViewModelProvider =
    AddPharmacyAddressViewModelProvider._();

final class AddPharmacyAddressViewModelProvider
    extends
        $NotifierProvider<
          AddPharmacyAddressViewModel,
          AddPharmacyAddressState
        > {
  const AddPharmacyAddressViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addPharmacyAddressViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addPharmacyAddressViewModelHash();

  @$internal
  @override
  AddPharmacyAddressViewModel create() => AddPharmacyAddressViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddPharmacyAddressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddPharmacyAddressState>(value),
    );
  }
}

String _$addPharmacyAddressViewModelHash() =>
    r'ee9c00eac937e24a8b1367e446add12276a9f391';

abstract class _$AddPharmacyAddressViewModel
    extends $Notifier<AddPharmacyAddressState> {
  AddPharmacyAddressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AddPharmacyAddressState, AddPharmacyAddressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddPharmacyAddressState, AddPharmacyAddressState>,
              AddPharmacyAddressState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
