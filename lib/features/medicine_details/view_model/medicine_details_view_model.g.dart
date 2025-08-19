// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicineDetailsViewModel)
const medicineDetailsViewModelProvider = MedicineDetailsViewModelProvider._();

final class MedicineDetailsViewModelProvider
    extends $NotifierProvider<MedicineDetailsViewModel, MedicineDetailsState> {
  const MedicineDetailsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'medicineDetailsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$medicineDetailsViewModelHash();

  @$internal
  @override
  MedicineDetailsViewModel create() => MedicineDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicineDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MedicineDetailsState>(value),
    );
  }
}

String _$medicineDetailsViewModelHash() =>
    r'c1ef264ed663681efc71d9e09cb85d73a334b914';

abstract class _$MedicineDetailsViewModel
    extends $Notifier<MedicineDetailsState> {
  MedicineDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MedicineDetailsState, MedicineDetailsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MedicineDetailsState, MedicineDetailsState>,
              MedicineDetailsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
