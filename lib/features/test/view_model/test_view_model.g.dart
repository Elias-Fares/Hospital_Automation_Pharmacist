// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TestViewModel)
const testViewModelProvider = TestViewModelProvider._();

final class TestViewModelProvider
    extends $NotifierProvider<TestViewModel, TestState> {
  const TestViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testViewModelHash();

  @$internal
  @override
  TestViewModel create() => TestViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TestState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TestState>(value),
    );
  }
}

String _$testViewModelHash() => r'3b101973adfb9b3eeafc0892b4c8bec390a56133';

abstract class _$TestViewModel extends $Notifier<TestState> {
  TestState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TestState, TestState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TestState, TestState>,
              TestState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
