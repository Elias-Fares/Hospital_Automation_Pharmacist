import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/notification_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "notifications_state.dart";
part 'notifications_view_model.g.dart';

@riverpod
class NotificationsViewModel extends _$NotificationsViewModel {
  @override
  NotificationsState build() => NotificationsState();

  final _repository = getIt<Repository>();

  Future<void> fetchNotifications() async {
    state = state.copyWith(notificationsResponse: AsyncValue.loading());
    final response = await _repository.showNotifications();
    if (response is DataSuccess) {
      state = state.copyWith(
        notificationsResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        notificationsResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
