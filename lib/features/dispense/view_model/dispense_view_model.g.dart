// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispense_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DispenseViewModel)
const dispenseViewModelProvider = DispenseViewModelProvider._();

final class DispenseViewModelProvider
    extends $NotifierProvider<DispenseViewModel, DispenseState> {
  const DispenseViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dispenseViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dispenseViewModelHash();

  @$internal
  @override
  DispenseViewModel create() => DispenseViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DispenseState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DispenseState>(value),
    );
  }
}

String _$dispenseViewModelHash() => r'2248f7aa2fc81c0147bab549edc9641472dd4f23';

abstract class _$DispenseViewModel extends $Notifier<DispenseState> {
  DispenseState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DispenseState, DispenseState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DispenseState, DispenseState>,
              DispenseState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
