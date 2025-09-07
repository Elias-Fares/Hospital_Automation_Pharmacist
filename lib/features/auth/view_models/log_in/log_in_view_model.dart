import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';
import '../../../../core/services/shared_preferences_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../permission_required/view/permission_required_screen.dart';
part 'log_in_view_model.g.dart';

@riverpod
class LogInViewModel extends _$LogInViewModel {
  @override
  AsyncValue? build() => null;

  final _repository = getIt<Repository>();

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();

    final response = await _repository.login(email: email, password: password);
    if (response is DataSuccess) {
      await _repository.saveEmail(email: email);
      await _repository.savePassword(password: password);
      await _repository.saveToken(token: response.data["token"].toString());
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
        response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
        StackTrace.current,
      );
    }
  }

  bool isTokenEmpty() {
    final token = _repository.getToken();
    final isTokenEmpty = token?.isEmpty ?? true;
    return isTokenEmpty;
  }

  bool? hasPermission;

  Future<void> fetchPermission() async {
    hasPermission = _repository.getHasPermission();

    if (hasPermission == true) {
      return;
    }

    final response = await _repository.userPermissions();

    if (response is DataSuccess) {
      await _repository.saveHasPermission(hasPermission: response.data.message);
      hasPermission = response.data.message;
    } else {
      hasPermission = false;
    }
  }

    Future<void> redirectionAfterLogin(BuildContext context) async {
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
