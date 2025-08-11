import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatchesState {
  final AsyncValue<dynamic>? addBatchResponse;

  BatchesState({this.addBatchResponse});

  BatchesState copyWith({AsyncValue<dynamic>? addBatchResponse}) =>
      BatchesState(addBatchResponse: addBatchResponse ?? this.addBatchResponse);
}
