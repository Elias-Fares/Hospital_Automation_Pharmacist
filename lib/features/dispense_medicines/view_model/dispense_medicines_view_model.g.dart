// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispense_medicines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DispenseMedicinesViewModel)
const dispenseMedicinesViewModelProvider =
    DispenseMedicinesViewModelProvider._();

final class DispenseMedicinesViewModelProvider
    extends
        $NotifierProvider<DispenseMedicinesViewModel, DispenseMedicinesState> {
  const DispenseMedicinesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dispenseMedicinesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dispenseMedicinesViewModelHash();

  @$internal
  @override
  DispenseMedicinesViewModel create() => DispenseMedicinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DispenseMedicinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DispenseMedicinesState>(value),
    );
  }
}

String _$dispenseMedicinesViewModelHash() =>
    r'd9ec25631136a55ebd3e984052f0349757fdf7b9';

abstract class _$DispenseMedicinesViewModel
    extends $Notifier<DispenseMedicinesState> {
  DispenseMedicinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DispenseMedicinesState, DispenseMedicinesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DispenseMedicinesState, DispenseMedicinesState>,
              DispenseMedicinesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
