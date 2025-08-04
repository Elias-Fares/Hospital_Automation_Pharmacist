// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(VerifyCodeViewModel)
const verifyCodeViewModelProvider = VerifyCodeViewModelProvider._();

final class VerifyCodeViewModelProvider
    extends $NotifierProvider<VerifyCodeViewModel, VerifyCodeState> {
  const VerifyCodeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyCodeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyCodeViewModelHash();

  @$internal
  @override
  VerifyCodeViewModel create() => VerifyCodeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyCodeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyCodeState>(value),
    );
  }
}

String _$verifyCodeViewModelHash() =>
    r'9dfedc1dece71281b0ba6520bd8e824a665ce4d0';

abstract class _$VerifyCodeViewModel extends $Notifier<VerifyCodeState> {
  VerifyCodeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VerifyCodeState, VerifyCodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VerifyCodeState, VerifyCodeState>,
              VerifyCodeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
