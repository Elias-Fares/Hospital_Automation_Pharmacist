import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scanner_state.dart';
part 'scanner_view_model.g.dart';

@riverpod
class ScannerViewModel extends _$ScannerViewModel {
  @override
  ScannerState build() => ScannerState(isScannerVisible: false);

  final _repository = getIt<Repository>();

  void toggleScannerVisibility() {
    state = state.copyWith(isScannerVisible: !state.isScannerVisible);
  }

  Future<void> getMedicineByBarcode({required String code}) async {
    if (code.isEmpty) {
      return;
    }
    state = state.copyWith(medicineResponse: AsyncValue.loading());
    final response = await _repository.getMedicineDetailsByBarcode(
      barcode: code,
    );

    if (response is DataSuccess) {
      state = state.copyWith(medicineResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        medicineResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
