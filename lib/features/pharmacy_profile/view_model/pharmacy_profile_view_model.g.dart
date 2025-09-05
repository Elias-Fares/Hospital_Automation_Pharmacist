// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PharmacyProfileViewModel)
const pharmacyProfileViewModelProvider = PharmacyProfileViewModelProvider._();

final class PharmacyProfileViewModelProvider
    extends $NotifierProvider<PharmacyProfileViewModel, PharmacyProfileState> {
  const PharmacyProfileViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pharmacyProfileViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pharmacyProfileViewModelHash();

  @$internal
  @override
  PharmacyProfileViewModel create() => PharmacyProfileViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PharmacyProfileState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PharmacyProfileState>(value),
    );
  }
}

String _$pharmacyProfileViewModelHash() =>
    r'4bd59bd0b8f3c0ed8e4ffaa65d7279f4aa844de3';

abstract class _$PharmacyProfileViewModel
    extends $Notifier<PharmacyProfileState> {
  PharmacyProfileState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PharmacyProfileState, PharmacyProfileState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PharmacyProfileState, PharmacyProfileState>,
              PharmacyProfileState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
