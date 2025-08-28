import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecifySaleAmountState {
  final AsyncValue? sellingResponse;

  SpecifySaleAmountState({this.sellingResponse});

  SpecifySaleAmountState copyWith({AsyncValue? sellingResponse}) {
    return SpecifySaleAmountState(
      sellingResponse: sellingResponse ?? this.sellingResponse,
    );
  }
}
