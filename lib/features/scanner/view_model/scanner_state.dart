class ScannerState {
  final bool isScannerVisible;

  ScannerState({required this.isScannerVisible});

  ScannerState copyWith({bool? isScannerVisible}) {
    return ScannerState(
      isScannerVisible: isScannerVisible ?? this.isScannerVisible,
    );
  }
}
