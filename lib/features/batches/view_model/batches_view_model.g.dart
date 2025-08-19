// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batches_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(BatchesViewModel)
const batchesViewModelProvider = BatchesViewModelProvider._();

final class BatchesViewModelProvider
    extends $NotifierProvider<BatchesViewModel, BatchesState> {
  const BatchesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchesViewModelHash();

  @$internal
  @override
  BatchesViewModel create() => BatchesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BatchesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BatchesState>(value),
    );
  }
}

String _$batchesViewModelHash() => r'0b6e6129ef1ae02323e7339ab68b888ac482fb15';

abstract class _$BatchesViewModel extends $Notifier<BatchesState> {
  BatchesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BatchesState, BatchesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BatchesState, BatchesState>,
              BatchesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
