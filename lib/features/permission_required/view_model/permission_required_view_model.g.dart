// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_required_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PermissionRequiredViewModel)
const permissionRequiredViewModelProvider =
    PermissionRequiredViewModelProvider._();

final class PermissionRequiredViewModelProvider
    extends
        $NotifierProvider<
          PermissionRequiredViewModel,
          PermissionRequiredState
        > {
  const PermissionRequiredViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionRequiredViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionRequiredViewModelHash();

  @$internal
  @override
  PermissionRequiredViewModel create() => PermissionRequiredViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionRequiredState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionRequiredState>(value),
    );
  }
}

String _$permissionRequiredViewModelHash() =>
    r'ae1c41c260bc0dd04712d8e7466adf3f38a35c73';

abstract class _$PermissionRequiredViewModel
    extends $Notifier<PermissionRequiredState> {
  PermissionRequiredState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<PermissionRequiredState, PermissionRequiredState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PermissionRequiredState, PermissionRequiredState>,
              PermissionRequiredState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
