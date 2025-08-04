// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicinesViewModel)
const medicinesViewModelProvider = MedicinesViewModelProvider._();

final class MedicinesViewModelProvider
    extends $NotifierProvider<MedicinesViewModel, MedicinesState> {
  const MedicinesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'medicinesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$medicinesViewModelHash();

  @$internal
  @override
  MedicinesViewModel create() => MedicinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MedicinesState>(value),
    );
  }
}

String _$medicinesViewModelHash() =>
    r'28b48835888014ec6da4de17356b56ff7e553c78';

abstract class _$MedicinesViewModel extends $Notifier<MedicinesState> {
  MedicinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MedicinesState, MedicinesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MedicinesState, MedicinesState>,
              MedicinesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
