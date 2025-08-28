import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/selling_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'statistics_state.dart';
part 'statistics_view_model.g.dart';

@riverpod
class StatisticsViewModel extends _$StatisticsViewModel {
  @override
  StatisticsState build() => StatisticsState();
  final _repository = getIt<Repository>();

  Future<void> getRevenue({required String from, required String to}) async {
    state = state.copyWith(revenueResponse: AsyncValue.loading());
    final response = await _repository.monthlyRevenu(date: "");

    if (response is DataSuccess) {
      state = state.copyWith(revenueResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        revenueResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> getMostLeastSold() async {
    state = state.copyWith(mostLeastSoldResponse: AsyncValue.loading());
    final response = await _repository.maximinMinimumSellings();

    if (response is DataSuccess) {
      state = state.copyWith(
        mostLeastSoldResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        mostLeastSoldResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
