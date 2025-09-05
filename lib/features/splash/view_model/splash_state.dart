part of 'splash_view_model.dart';

class SplashState {
  final AsyncValue<PermissionModel>? permissionResponse;

  SplashState({this.permissionResponse});

  SplashState copyWith({AsyncValue<PermissionModel>? permissionResponse}) {
    return SplashState(permissionResponse: permissionResponse);
  }
}
