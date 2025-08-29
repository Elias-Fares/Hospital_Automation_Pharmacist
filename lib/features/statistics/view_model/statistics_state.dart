part of 'statistics_view_model.dart';

class StatisticsState {
  final AsyncValue<List<MonthlyRevenuModel>>? revenueResponse;
  final AsyncValue<SellingModel>? mostLeastSoldResponse;
  final int selectedYear;
  final DateTime medicineSaleDate;

  StatisticsState({
    this.revenueResponse,
    this.mostLeastSoldResponse,
    required this.selectedYear,
    required this.medicineSaleDate
  });

  StatisticsState copyWith({
    AsyncValue<List<MonthlyRevenuModel>>? revenueResponse,
    AsyncValue<SellingModel>? mostLeastSoldResponse,
    int? selectedYear,
    DateTime? medicineSaleDate
  }) {
    return StatisticsState(
      revenueResponse: revenueResponse ?? this.revenueResponse,
      mostLeastSoldResponse:
          mostLeastSoldResponse ?? this.mostLeastSoldResponse,
      selectedYear: selectedYear ?? this.selectedYear,
      medicineSaleDate: medicineSaleDate ?? this.medicineSaleDate
    );
  }
}
