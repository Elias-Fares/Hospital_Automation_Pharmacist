// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_work_days_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(EditWorkDaysViewModel)
const editWorkDaysViewModelProvider = EditWorkDaysViewModelProvider._();

final class EditWorkDaysViewModelProvider
    extends $NotifierProvider<EditWorkDaysViewModel, EditWorkDaysState> {
  const EditWorkDaysViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editWorkDaysViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editWorkDaysViewModelHash();

  @$internal
  @override
  EditWorkDaysViewModel create() => EditWorkDaysViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditWorkDaysState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditWorkDaysState>(value),
    );
  }
}

String _$editWorkDaysViewModelHash() =>
    r'8ca47cc5db315c79d34e7b7df391e708a47fa67b';

abstract class _$EditWorkDaysViewModel extends $Notifier<EditWorkDaysState> {
  EditWorkDaysState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EditWorkDaysState, EditWorkDaysState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditWorkDaysState, EditWorkDaysState>,
              EditWorkDaysState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
