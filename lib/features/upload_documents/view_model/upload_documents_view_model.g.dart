// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_documents_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UploadDocumentsViewModel)
const uploadDocumentsViewModelProvider = UploadDocumentsViewModelProvider._();

final class UploadDocumentsViewModelProvider
    extends $NotifierProvider<UploadDocumentsViewModel, UploadDocumentsState> {
  const UploadDocumentsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadDocumentsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadDocumentsViewModelHash();

  @$internal
  @override
  UploadDocumentsViewModel create() => UploadDocumentsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadDocumentsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadDocumentsState>(value),
    );
  }
}

String _$uploadDocumentsViewModelHash() =>
    r'40f9d5d7a0d49c1d7fd38da3d0dc86ec7cd7aea2';

abstract class _$UploadDocumentsViewModel
    extends $Notifier<UploadDocumentsState> {
  UploadDocumentsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UploadDocumentsState, UploadDocumentsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UploadDocumentsState, UploadDocumentsState>,
              UploadDocumentsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
