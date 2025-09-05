import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/models/work_day.dart';

class EditWorkDaysState {
  final AsyncValue<List<WorkDay>>? workDaysResponse;
  final AsyncValue? deleteWorkDay;
  final AsyncValue? addWorkDay;
  final String? day;
  final String? openTime;
  final String? closeTime;

  EditWorkDaysState({
    this.workDaysResponse,
    this.day,
    this.openTime,
    this.closeTime,
    this.addWorkDay,
    this.deleteWorkDay
  });
  EditWorkDaysState copyWith({
    AsyncValue<List<WorkDay>>? workDaysResponse,
    String? day,
    String? openTime,
    String? closeTime,
       AsyncValue? deleteWorkDay,
   AsyncValue? addWorkDay,
  }) => EditWorkDaysState(
    workDaysResponse: workDaysResponse ?? this.workDaysResponse,
    closeTime: closeTime ?? this.closeTime,
    day: day ?? this.day,
    openTime: openTime ?? this.openTime,
    addWorkDay: addWorkDay ?? this.addWorkDay,
    deleteWorkDay: deleteWorkDay ?? this.deleteWorkDay
  );
}
