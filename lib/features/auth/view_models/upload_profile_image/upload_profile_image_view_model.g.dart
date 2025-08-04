// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_image_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UploadProfileImageViewModel)
const uploadProfileImageViewModelProvider =
    UploadProfileImageViewModelProvider._();

final class UploadProfileImageViewModelProvider
    extends
        $NotifierProvider<
          UploadProfileImageViewModel,
          UploadProfileImageState
        > {
  const UploadProfileImageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadProfileImageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadProfileImageViewModelHash();

  @$internal
  @override
  UploadProfileImageViewModel create() => UploadProfileImageViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadProfileImageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadProfileImageState>(value),
    );
  }
}

String _$uploadProfileImageViewModelHash() =>
    r'e26821ae6a10aa431f5956b6ff080c5f49c3f821';

abstract class _$UploadProfileImageViewModel
    extends $Notifier<UploadProfileImageState> {
  UploadProfileImageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<UploadProfileImageState, UploadProfileImageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UploadProfileImageState, UploadProfileImageState>,
              UploadProfileImageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
