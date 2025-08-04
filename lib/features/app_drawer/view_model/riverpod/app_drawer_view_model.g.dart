// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_drawer_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppDrawerViewModel)
const appDrawerViewModelProvider = AppDrawerViewModelProvider._();

final class AppDrawerViewModelProvider
    extends $NotifierProvider<AppDrawerViewModel, AppDrawerState> {
  const AppDrawerViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDrawerViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDrawerViewModelHash();

  @$internal
  @override
  AppDrawerViewModel create() => AppDrawerViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDrawerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDrawerState>(value),
    );
  }
}

String _$appDrawerViewModelHash() =>
    r'3d3ce0dc0b8ee5d79aaab5308466d723b4c56400';

abstract class _$AppDrawerViewModel extends $Notifier<AppDrawerState> {
  AppDrawerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppDrawerState, AppDrawerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppDrawerState, AppDrawerState>,
              AppDrawerState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
