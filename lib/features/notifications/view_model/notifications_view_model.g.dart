// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NotificationsViewModel)
const notificationsViewModelProvider = NotificationsViewModelProvider._();

final class NotificationsViewModelProvider
    extends $NotifierProvider<NotificationsViewModel, NotificationsState> {
  const NotificationsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsViewModelHash();

  @$internal
  @override
  NotificationsViewModel create() => NotificationsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsState>(value),
    );
  }
}

String _$notificationsViewModelHash() =>
    r'a88a2475121938f326cc8c1b38d62429143c6cbf';

abstract class _$NotificationsViewModel extends $Notifier<NotificationsState> {
  NotificationsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NotificationsState, NotificationsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationsState, NotificationsState>,
              NotificationsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
