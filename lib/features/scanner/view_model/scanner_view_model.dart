import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'scanner_state.dart';
part 'scanner_view_model.g.dart';

@riverpod
class ScannerViewModel extends _$ScannerViewModel {
  @override
  ScannerState build() => ScannerState(isScannerVisible: false);

  void toggleScannerVisibility() {
    state = state.copyWith(isScannerVisible: !state.isScannerVisible);
  }
}
