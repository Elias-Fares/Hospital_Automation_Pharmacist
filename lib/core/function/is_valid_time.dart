bool isValidTime(String? time) {
  if (time == null) {
    return false;
  }

  // Matches HH:mm or HH:mm:ss (24-hour format)
  final regex = RegExp(r'^(?:[01]\d|2[0-3]):[0-5]\d(?:\:[0-5]\d)?$');
  return regex.hasMatch(time);
}
