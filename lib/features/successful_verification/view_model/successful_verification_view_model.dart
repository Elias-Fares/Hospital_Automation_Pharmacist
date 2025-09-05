import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'successful_verification_view_model.g.dart';
part 'successful_verification_state.dart';

@riverpod
class SuccessfulVerificationViewModel
    extends _$SuccessfulVerificationViewModel {
  @override
  SuccessfulVerificationState build() => SuccessfulVerificationState();

  final _repository = getIt<Repository>();

  Future<void> autoLogin() async {
    final email = _repository.getEmail();
    final password = _repository.getPassword();

    if (email == null || password == null) {
      return;
    }

    state = state.copyWith(autoLoginReposne: AsyncValue.loading());

    final response = await _repository.login(email: email, password: password);

    if (response is DataSuccess) {
      await _repository.saveEmail(email: email);
      await _repository.savePassword(password: password);
      await _repository.saveToken(token: response.data["token"].toString());
      state = state.copyWith(autoLoginReposne: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        autoLoginReposne: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
