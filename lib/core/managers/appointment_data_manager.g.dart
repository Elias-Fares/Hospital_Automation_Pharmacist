// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_data_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(appointmentDataManager)
const appointmentDataManagerProvider = AppointmentDataManagerProvider._();

final class AppointmentDataManagerProvider
    extends
        $FunctionalProvider<
          AppointmentDataManager,
          AppointmentDataManager,
          AppointmentDataManager
        >
    with $Provider<AppointmentDataManager> {
  const AppointmentDataManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentDataManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentDataManagerHash();

  @$internal
  @override
  $ProviderElement<AppointmentDataManager> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppointmentDataManager create(Ref ref) {
    return appointmentDataManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppointmentDataManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppointmentDataManager>(value),
    );
  }
}

String _$appointmentDataManagerHash() =>
    r'dcfcf59dffcc4b3414c14eb459511b1d657e6955';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
