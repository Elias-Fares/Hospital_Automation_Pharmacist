// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SignUpViewModel)
const signUpViewModelProvider = SignUpViewModelProvider._();

final class SignUpViewModelProvider
    extends $NotifierProvider<SignUpViewModel, SignUpState> {
  const SignUpViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpViewModelHash();

  @$internal
  @override
  SignUpViewModel create() => SignUpViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpState>(value),
    );
  }
}

String _$signUpViewModelHash() => r'5dd5d3b0f8e9e44df6133ecba6cf8e2c90b16c75';

abstract class _$SignUpViewModel extends $Notifier<SignUpState> {
  SignUpState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignUpState, SignUpState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignUpState, SignUpState>,
              SignUpState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
