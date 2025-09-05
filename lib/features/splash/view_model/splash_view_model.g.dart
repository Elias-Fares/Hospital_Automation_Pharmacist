// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SplashViewModel)
const splashViewModelProvider = SplashViewModelProvider._();

final class SplashViewModelProvider
    extends $NotifierProvider<SplashViewModel, SplashState> {
  const SplashViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashViewModelHash();

  @$internal
  @override
  SplashViewModel create() => SplashViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashState>(value),
    );
  }
}

String _$splashViewModelHash() => r'41f2bc633196d65c8bf5e7862449e5923584b2fd';

abstract class _$SplashViewModel extends $Notifier<SplashState> {
  SplashState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SplashState, SplashState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SplashState, SplashState>,
              SplashState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
