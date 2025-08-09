import 'package:flutter_riverpod/flutter_riverpod.dart';

class MedicineDetailsState {
  final AsyncValue<dynamic>? deleteMedReposne;

  MedicineDetailsState({ this.deleteMedReposne});

  MedicineDetailsState copyWith({AsyncValue<dynamic>? deleteMedReposne}) => MedicineDetailsState(deleteMedReposne: deleteMedReposne ?? this.deleteMedReposne);
}
