// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_medicine_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddNewMedicineViewModel)
const addNewMedicineViewModelProvider = AddNewMedicineViewModelProvider._();

final class AddNewMedicineViewModelProvider
    extends $NotifierProvider<AddNewMedicineViewModel, AddNewMedicineState> {
  const AddNewMedicineViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addNewMedicineViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addNewMedicineViewModelHash();

  @$internal
  @override
  AddNewMedicineViewModel create() => AddNewMedicineViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddNewMedicineState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddNewMedicineState>(value),
    );
  }
}

String _$addNewMedicineViewModelHash() =>
    r'5c672443e191f244aaecca0868d704bcc15cf668';

abstract class _$AddNewMedicineViewModel
    extends $Notifier<AddNewMedicineState> {
  AddNewMedicineState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddNewMedicineState, AddNewMedicineState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddNewMedicineState, AddNewMedicineState>,
              AddNewMedicineState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
