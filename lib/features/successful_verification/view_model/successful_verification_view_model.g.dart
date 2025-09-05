// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'successful_verification_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SuccessfulVerificationViewModel)
const successfulVerificationViewModelProvider =
    SuccessfulVerificationViewModelProvider._();

final class SuccessfulVerificationViewModelProvider
    extends
        $NotifierProvider<
          SuccessfulVerificationViewModel,
          SuccessfulVerificationState
        > {
  const SuccessfulVerificationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'successfulVerificationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$successfulVerificationViewModelHash();

  @$internal
  @override
  SuccessfulVerificationViewModel create() => SuccessfulVerificationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SuccessfulVerificationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SuccessfulVerificationState>(value),
    );
  }
}

String _$successfulVerificationViewModelHash() =>
    r'accbd2a052bcbba8ca1b8a31496aac704ffe2271';

abstract class _$SuccessfulVerificationViewModel
    extends $Notifier<SuccessfulVerificationState> {
  SuccessfulVerificationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<SuccessfulVerificationState, SuccessfulVerificationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                SuccessfulVerificationState,
                SuccessfulVerificationState
              >,
              SuccessfulVerificationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
