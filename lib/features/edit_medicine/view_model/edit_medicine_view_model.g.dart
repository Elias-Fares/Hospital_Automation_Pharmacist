// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_medicine_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(EditMedicineViewModel)
const editMedicineViewModelProvider = EditMedicineViewModelProvider._();

final class EditMedicineViewModelProvider
    extends $NotifierProvider<EditMedicineViewModel, EditMedicineState> {
  const EditMedicineViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editMedicineViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editMedicineViewModelHash();

  @$internal
  @override
  EditMedicineViewModel create() => EditMedicineViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditMedicineState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditMedicineState>(value),
    );
  }
}

String _$editMedicineViewModelHash() =>
    r'cb2a62bc772e3dec5454306f1b291c22d2be14ed';

abstract class _$EditMedicineViewModel extends $Notifier<EditMedicineState> {
  EditMedicineState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EditMedicineState, EditMedicineState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditMedicineState, EditMedicineState>,
              EditMedicineState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
