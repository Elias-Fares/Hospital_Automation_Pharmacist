import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/services/notification_service.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'main_state.dart';
part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() => MainState(selectedIndex: 0);

  final _repository = getIt<Repository>();

  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> notificationTrigger() async {
    final fcmToken = await NotificationService.getFCMToken();
    if (fcmToken == null || fcmToken.isEmpty) return;
    state = state.copyWith(notificationTrigger: AsyncValue.loading());
    final response = await _repository.notificationTrigger(fcm: fcmToken);

    if (response is DataSuccess) {
      state = state.copyWith(
        notificationTrigger: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        notificationTrigger: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
