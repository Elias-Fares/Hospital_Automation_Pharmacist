class BookAppointmentEntity {
  final String? doctorId;
  final String? appointmentType;
  final String? date;
  final String? time;
  final String? type;
  final String? childId;
  final String? vaccineId;

  const BookAppointmentEntity({
    this.doctorId,
    this.appointmentType,
    this.date,
    this.time,
    this.type,
    this.childId,
    this.vaccineId,
  });

  static const _noValue = Object();

  BookAppointmentEntity copyWith({
    Object? doctorId = _noValue,
    Object? appointmentType = _noValue,
    Object? date = _noValue,
    Object? time = _noValue,
    Object? type = _noValue,
    Object? childId = _noValue,
    Object? vaccineId = _noValue,
  }) {
    return BookAppointmentEntity(
      doctorId: doctorId == _noValue ? this.doctorId : doctorId as String?,
      appointmentType: appointmentType == _noValue
          ? this.appointmentType
          : appointmentType as String?,
      date: date == _noValue ? this.date : date as String?,
      time: time == _noValue ? this.time : time as String?,
      type: type == _noValue ? this.type : type as String?,
      childId: childId == _noValue ? this.childId : childId as String?,
      vaccineId: vaccineId == _noValue ? this.vaccineId : vaccineId as String?,
    );
  }

  @override
  String toString() {
    return 'BookAppointmentEntity('
        'doctorId: $doctorId, '
        'childId: $childId, '
        'appointmentType: $appointmentType, '
        'date: $date, '
        'type: $type, '
        'time: $time, '
        'vaccineId: $vaccineId)';
  }
}
