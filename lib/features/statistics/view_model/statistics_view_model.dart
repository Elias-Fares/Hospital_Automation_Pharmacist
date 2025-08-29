import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/monthly_revenu_model.dart';
import 'package:medicare_pharmacy/data/models/selling_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'statistics_state.dart';
part 'statistics_view_model.g.dart';

@riverpod
class StatisticsViewModel extends _$StatisticsViewModel {
  @override
  StatisticsState build() {
    final currentDate = DateTime.now();
    return StatisticsState(
      selectedYear: currentDate.year,
      medicineSaleDate: currentDate,
    );
  }

  final _repository = getIt<Repository>();

  void _onYearChanged(int year) {
    state = state.copyWith(selectedYear: year);
  }

  void handleOnSelectDateTap({required DateTime? dateTime}) {
    if (dateTime == null) {
      return;
    }
    state = state.copyWith(medicineSaleDate: dateTime);

    fetchMostLeastSold(date: dateTime);
  }

  Future<void> fetchRevenueByYear({required int? year}) async {
    if (year == null) {
      return;
    }
    _onYearChanged(year);
    fetchRevenue(year: year);
  }

  Future<void> retryFetchRevenueByYear() async {
    fetchRevenue(year: state.selectedYear);
  }

  Future<void> fetchRevenue({required int year}) async {
    state = state.copyWith(revenueResponse: AsyncValue.loading());
    final response = await _repository.monthlyRevenu(year: year);

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

  Future<void> fetchMostLeastSold({required DateTime date}) async {
    state = state.copyWith(mostLeastSoldResponse: AsyncValue.loading());
    final response = await _repository.maximinMinimumSellings(date: date);

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
