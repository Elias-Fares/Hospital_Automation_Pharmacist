import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/features/alternative_medicines/view_model/alternative_medicines_view_model.dart';

final medicineIdProvider = Provider<String>((ref) {
  final state = ref.watch(alternativeMedicinesViewModelProvider);
  return state.altsResponse?.value?.medicineId?.toString() ?? "NOTVALID";
});
