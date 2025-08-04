// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_existing_alternative_medicines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddExistingAlternativeMedicinesViewModel)
const addExistingAlternativeMedicinesViewModelProvider =
    AddExistingAlternativeMedicinesViewModelProvider._();

final class AddExistingAlternativeMedicinesViewModelProvider
    extends
        $NotifierProvider<
          AddExistingAlternativeMedicinesViewModel,
          AddExistingAlternativeMedicinesState
        > {
  const AddExistingAlternativeMedicinesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExistingAlternativeMedicinesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$addExistingAlternativeMedicinesViewModelHash();

  @$internal
  @override
  AddExistingAlternativeMedicinesViewModel create() =>
      AddExistingAlternativeMedicinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddExistingAlternativeMedicinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AddExistingAlternativeMedicinesState>(value),
    );
  }
}

String _$addExistingAlternativeMedicinesViewModelHash() =>
    r'33694a4b770c8600f0d133aa56be3a1c89a0c185';

abstract class _$AddExistingAlternativeMedicinesViewModel
    extends $Notifier<AddExistingAlternativeMedicinesState> {
  AddExistingAlternativeMedicinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AddExistingAlternativeMedicinesState,
              AddExistingAlternativeMedicinesState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AddExistingAlternativeMedicinesState,
                AddExistingAlternativeMedicinesState
              >,
              AddExistingAlternativeMedicinesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
