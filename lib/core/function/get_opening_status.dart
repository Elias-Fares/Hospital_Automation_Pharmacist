import '../models/work_day.dart';

String getOpeningStatus(List<WorkDay> workDays) {
  final now = DateTime.now();
  final currentWeekday = _weekdayToString(now.weekday); // e.g., "SUNDAY"
  final currentTimeInMinutes = now.hour * 60 + now.minute;

  // Filter the work days that match today
  final todayWorkSlots = workDays
      .where((day) => day.day?.toUpperCase() == currentWeekday)
      .toList();

  if (todayWorkSlots.isEmpty) {
    return "Closed";
  }

  for (final slot in todayWorkSlots) {
    final startMinutes = _parseTimeToMinutes(slot.workStartTime);
    final endMinutes = _parseTimeToMinutes(slot.workEndTime);

    if (startMinutes != null && endMinutes != null) {
      if (currentTimeInMinutes >= startMinutes &&
          currentTimeInMinutes <= endMinutes) {
        return "Open";
      }
    }
  }

  return "Closed";
}

// Converts weekday int (1=Monday) to string like "MONDAY"
String _weekdayToString(int weekday) {
  const days = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];
  return days[weekday - 1];
}

// Parses "HH:mm" or "HH:mm:ss" into minutes from midnight
int? _parseTimeToMinutes(String? timeString) {
  if (timeString == null) return null;
  try {
    final parts = timeString.split(':').map(int.parse).toList();
    final hour = parts[0];
    final minute = parts.length > 1 ? parts[1] : 0;
    return hour * 60 + minute;
  } catch (_) {
    return null;
  }
}
