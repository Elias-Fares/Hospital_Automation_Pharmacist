import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/permission_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/login_screen.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/permission_required/view/permission_required_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'splash_state.dart';
part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  SplashState build() => SplashState();

  final _repository = getIt<Repository>();

  bool? hasPermission;

  Future<void> fetchPermission() async {
    hasPermission = _repository.getHasPermission();

    if (hasPermission == true) {
      return;
    }

    state = state.copyWith(permissionResponse: AsyncValue.loading());
    final response = await _repository.userPermissions();

    if (response is DataSuccess) {
      await _repository.saveHasPermission(hasPermission: response.data.message);
      hasPermission = response.data.message;
      state = state.copyWith(
        permissionResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        permissionResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> redirection(BuildContext context) async {
    final token = _repository.getToken() ?? "";

    if (token.isEmpty) {
      context.go(LoginScreen.routeName);
    } else {
      await fetchPermission();

      if (context.mounted) {
        if (hasPermission == true) {
          context.go(MainScreen.routeName);
        } else {
          context.go(PermissionRequiredScreen.routeName);
          // context.go(LoginScreen.routeName);
        }
      }
    }
  }
}
