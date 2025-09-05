// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(StatisticsViewModel)
const statisticsViewModelProvider = StatisticsViewModelProvider._();

final class StatisticsViewModelProvider
    extends $NotifierProvider<StatisticsViewModel, StatisticsState> {
  const StatisticsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statisticsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statisticsViewModelHash();

  @$internal
  @override
  StatisticsViewModel create() => StatisticsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StatisticsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StatisticsState>(value),
    );
  }
}

String _$statisticsViewModelHash() =>
    r'3bc85ba9ff59f71f0a33205309d2a102a9f4dd1a';

abstract class _$StatisticsViewModel extends $Notifier<StatisticsState> {
  StatisticsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StatisticsState, StatisticsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StatisticsState, StatisticsState>,
              StatisticsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
