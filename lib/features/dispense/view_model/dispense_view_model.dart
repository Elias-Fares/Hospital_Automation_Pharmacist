import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/params_values.dart';
import 'package:medicare_pharmacy/data/models/prescription_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dispense_state.dart';
part 'dispense_view_model.g.dart';

@riverpod
class DispenseViewModel extends _$DispenseViewModel {
  @override
  DispenseState build() => DispenseState();

  final _repository = getIt<Repository>();

  Future<void> getPrescription({String code = ""}) async {
    if (code.isEmpty) {
      return;
    }
    state = state.copyWith(prescriptionResponse: AsyncValue.loading());
    final response = await _repository.searchprescription(
      code: code,
      view: ParamsValues.details.value,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        prescriptionResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        prescriptionResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
