// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(LogInViewModel)
const logInViewModelProvider = LogInViewModelProvider._();

final class LogInViewModelProvider
    extends $NotifierProvider<LogInViewModel, AsyncValue?> {
  const LogInViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logInViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logInViewModelHash();

  @$internal
  @override
  LogInViewModel create() => LogInViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue?>(value),
    );
  }
}

String _$logInViewModelHash() => r'635f37f543d19e14588e0d3533f8690c9e30b7f0';

abstract class _$LogInViewModel extends $Notifier<AsyncValue?> {
  AsyncValue? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue?, AsyncValue?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue?, AsyncValue?>,
              AsyncValue?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
