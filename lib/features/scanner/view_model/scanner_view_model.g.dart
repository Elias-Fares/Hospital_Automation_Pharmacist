// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ScannerViewModel)
const scannerViewModelProvider = ScannerViewModelProvider._();

final class ScannerViewModelProvider
    extends $NotifierProvider<ScannerViewModel, ScannerState> {
  const ScannerViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scannerViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scannerViewModelHash();

  @$internal
  @override
  ScannerViewModel create() => ScannerViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScannerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScannerState>(value),
    );
  }
}

String _$scannerViewModelHash() => r'fb6a617dd669332bf91606c89161c54e93a56ead';

abstract class _$ScannerViewModel extends $Notifier<ScannerState> {
  ScannerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ScannerState, ScannerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScannerState, ScannerState>,
              ScannerState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
