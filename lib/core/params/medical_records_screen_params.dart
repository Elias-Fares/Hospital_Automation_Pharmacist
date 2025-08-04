import '../enums/params_values.dart';

class MedicalRecordsScreenParams {
  final ParamsValues comingFrom;
  final String? childId;
  final String? childName;

  MedicalRecordsScreenParams({required this.comingFrom, this.childId, this.childName});
}
