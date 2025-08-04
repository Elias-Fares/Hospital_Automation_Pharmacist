import '../enums/params_values.dart';

class PrescriptionsScreenParams {
  final ParamsValues comingFrom;
  final String? childId;
  final String? pharmacyId;
  final String? childName;
  final String? doctorName;

  PrescriptionsScreenParams(
      {required this.comingFrom, this.childId, this.pharmacyId,this.childName, this.doctorName, });
}
