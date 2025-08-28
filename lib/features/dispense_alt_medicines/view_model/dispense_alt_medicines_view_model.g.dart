// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispense_alt_medicines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DispenseAltMedicinesViewModel)
const dispenseAltMedicinesViewModelProvider =
    DispenseAltMedicinesViewModelProvider._();

final class DispenseAltMedicinesViewModelProvider
    extends
        $NotifierProvider<
          DispenseAltMedicinesViewModel,
          DispenseAltMedicinesState
        > {
  const DispenseAltMedicinesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dispenseAltMedicinesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dispenseAltMedicinesViewModelHash();

  @$internal
  @override
  DispenseAltMedicinesViewModel create() => DispenseAltMedicinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DispenseAltMedicinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DispenseAltMedicinesState>(value),
    );
  }
}

String _$dispenseAltMedicinesViewModelHash() =>
    r'7e30e7cbeed934924fa0c5f4c13fea92477c1677';

abstract class _$DispenseAltMedicinesViewModel
    extends $Notifier<DispenseAltMedicinesState> {
  DispenseAltMedicinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DispenseAltMedicinesState, DispenseAltMedicinesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DispenseAltMedicinesState, DispenseAltMedicinesState>,
              DispenseAltMedicinesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
