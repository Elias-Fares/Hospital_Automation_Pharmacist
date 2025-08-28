// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specify_sale_amount_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SpecifySaleAmountViewModel)
const specifySaleAmountViewModelProvider =
    SpecifySaleAmountViewModelProvider._();

final class SpecifySaleAmountViewModelProvider
    extends
        $NotifierProvider<SpecifySaleAmountViewModel, SpecifySaleAmountState> {
  const SpecifySaleAmountViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'specifySaleAmountViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$specifySaleAmountViewModelHash();

  @$internal
  @override
  SpecifySaleAmountViewModel create() => SpecifySaleAmountViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SpecifySaleAmountState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SpecifySaleAmountState>(value),
    );
  }
}

String _$specifySaleAmountViewModelHash() =>
    r'ab8daf8424df98744d7242283a73c7ad6693ef3a';

abstract class _$SpecifySaleAmountViewModel
    extends $Notifier<SpecifySaleAmountState> {
  SpecifySaleAmountState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SpecifySaleAmountState, SpecifySaleAmountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SpecifySaleAmountState, SpecifySaleAmountState>,
              SpecifySaleAmountState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
