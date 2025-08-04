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

String _$scannerViewModelHash() => r'3db7874f5e58b9dae5792ffabe39cc42949703f1';

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
