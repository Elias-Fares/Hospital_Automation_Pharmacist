// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternative_medicines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AlternativeMedicinesViewModel)
const alternativeMedicinesViewModelProvider =
    AlternativeMedicinesViewModelProvider._();

final class AlternativeMedicinesViewModelProvider
    extends
        $NotifierProvider<
          AlternativeMedicinesViewModel,
          AlternativeMedicinesState
        > {
  const AlternativeMedicinesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alternativeMedicinesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alternativeMedicinesViewModelHash();

  @$internal
  @override
  AlternativeMedicinesViewModel create() => AlternativeMedicinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlternativeMedicinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlternativeMedicinesState>(value),
    );
  }
}

String _$alternativeMedicinesViewModelHash() =>
    r'241d4ac62cef7bbe1fbd19c3176700f60f38c5b6';

abstract class _$AlternativeMedicinesViewModel
    extends $Notifier<AlternativeMedicinesState> {
  AlternativeMedicinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AlternativeMedicinesState, AlternativeMedicinesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AlternativeMedicinesState, AlternativeMedicinesState>,
              AlternativeMedicinesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
