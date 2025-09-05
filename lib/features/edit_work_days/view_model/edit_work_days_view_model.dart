import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/params_values.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'edit_work_days_state.dart';
part 'edit_work_days_view_model.g.dart';

@riverpod
class EditWorkDaysViewModel extends _$EditWorkDaysViewModel {
  @override
  EditWorkDaysState build() => EditWorkDaysState();
  final _repository = getIt<Repository>();

  void selectDay(String day) {
    state = state.copyWith(day: day);
  }

  void selectOpenTime(String openTime) {
    state = state.copyWith(openTime: openTime);
  }

  void selectCloseTime(String closeTime) {
    state = state.copyWith(closeTime: closeTime);
  }

  Future<void> fetchWorkDays() async {
    state = state.copyWith(workDaysResponse: AsyncValue.loading());

    final response = await _repository.getWorkDays();

    if (response is DataSuccess) {
      state = state.copyWith(workDaysResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        workDaysResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> addWorkDay() async {
    if (state.closeTime == null ||
        state.openTime == null ||
        state.day == null) {
      return;
    }
    state = state.copyWith(addWorkDay: AsyncValue.loading());

    final response = await _repository.workDaysProcesses(
      requestType: ParamsValues.create,
      day: state.day,
      closeAt: state.closeTime,
      opensAt: state.openTime,
    );

    if (response is DataSuccess) {
      state = state.copyWith(addWorkDay: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        addWorkDay: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
