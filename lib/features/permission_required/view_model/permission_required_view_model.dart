import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'permission_required_state.dart';
part 'permission_required_view_model.g.dart';

@riverpod
class PermissionRequiredViewModel extends _$PermissionRequiredViewModel {
  @override
  PermissionRequiredState build() => PermissionRequiredState();

}

