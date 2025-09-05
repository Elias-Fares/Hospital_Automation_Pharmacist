import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';
import '../../../../core/services/shared_preferences_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
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



}
