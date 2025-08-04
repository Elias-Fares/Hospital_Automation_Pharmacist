// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MainViewModel)
const mainViewModelProvider = MainViewModelProvider._();

final class MainViewModelProvider
    extends $NotifierProvider<MainViewModel, MainState> {
  const MainViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainViewModelHash();

  @$internal
  @override
  MainViewModel create() => MainViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainState>(value),
    );
  }
}

String _$mainViewModelHash() => r'0139776bf72e5f245ed4de27086c00a02668a12b';

abstract class _$MainViewModel extends $Notifier<MainState> {
  MainState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MainState, MainState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainState, MainState>,
              MainState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
