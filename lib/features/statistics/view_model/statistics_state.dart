part of 'statistics_view_model.dart';

class StatisticsState {
final AsyncValue? revenueResponse;
final AsyncValue<SellingModel>? mostLeastSoldResponse;

  StatisticsState({
    this.revenueResponse,
    this.mostLeastSoldResponse,
  });

  StatisticsState copyWith({
    AsyncValue? revenueResponse,
    AsyncValue<SellingModel>? mostLeastSoldResponse,
  }) {
    return StatisticsState(
      revenueResponse: revenueResponse ?? this.revenueResponse,
      mostLeastSoldResponse: mostLeastSoldResponse ?? this.mostLeastSoldResponse,
    );
  }
}

