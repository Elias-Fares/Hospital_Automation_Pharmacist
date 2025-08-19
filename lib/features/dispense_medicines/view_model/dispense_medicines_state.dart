part of 'dispense_medicines_view_model.dart';

class DispenseMedicinesState {
  final AsyncValue? markAsDispencedResponse;
  final Map<String, DispenceStatus> dispenceStatus;

  DispenseMedicinesState({
    this.markAsDispencedResponse,
    this.dispenceStatus = const {},
  });

  DispenseMedicinesState copyWith({
    AsyncValue? markAsDispencedResponse,
    Map<String, DispenceStatus>? dispenceStatus,
  }) => DispenseMedicinesState(
    markAsDispencedResponse:
        markAsDispencedResponse ?? this.markAsDispencedResponse,
    dispenceStatus: dispenceStatus ?? this.dispenceStatus,
  );
}
