// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_residential_address_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddResidentialAddressViewModel)
const addResidentialAddressViewModelProvider =
    AddResidentialAddressViewModelProvider._();

final class AddResidentialAddressViewModelProvider
    extends
        $NotifierProvider<
          AddResidentialAddressViewModel,
          AddResidentialAddressState
        > {
  const AddResidentialAddressViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addResidentialAddressViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addResidentialAddressViewModelHash();

  @$internal
  @override
  AddResidentialAddressViewModel create() => AddResidentialAddressViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddResidentialAddressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddResidentialAddressState>(value),
    );
  }
}

String _$addResidentialAddressViewModelHash() =>
    r'e9a4caed041b8a294023b2029e0c3cc6b40d1a41';

abstract class _$AddResidentialAddressViewModel
    extends $Notifier<AddResidentialAddressState> {
  AddResidentialAddressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AddResidentialAddressState, AddResidentialAddressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AddResidentialAddressState,
                AddResidentialAddressState
              >,
              AddResidentialAddressState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
