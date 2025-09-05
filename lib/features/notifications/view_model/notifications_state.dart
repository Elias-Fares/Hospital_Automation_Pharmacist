part of 'notifications_view_model.dart';

class NotificationsState {
  final AsyncValue<List<NotificationModel>>? notificationsResponse;

  NotificationsState({this.notificationsResponse});

  NotificationsState copyWith({
    AsyncValue<List<NotificationModel>>? notificationsResponse,
  }) {
    return NotificationsState(notificationsResponse: notificationsResponse ?? this.notificationsResponse);
  }
}
