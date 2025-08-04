import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'batches_state.dart';
part 'batches_view_model.g.dart';

@riverpod
class BatchesViewModel extends _$BatchesViewModel {
  @override
  BatchesState build() => BatchesState();

}

