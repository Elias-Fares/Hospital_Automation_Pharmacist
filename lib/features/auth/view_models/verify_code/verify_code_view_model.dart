import 'package:medicare_pharmacy/data/repository.dart';

import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';
// import '../../../../data/auth/repository/auth_repository.dart';
import 'verify_code_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'verify_code_view_model.g.dart';

@riverpod
class VerifyCodeViewModel extends _$VerifyCodeViewModel {
  @override
  VerifyCodeState build() => VerifyCodeState();

  final _repository = getIt<Repository>();

  String getEmail () {
    return _repository.getEmail() ?? "";
  }

  Future<void> sendOTP() async {
    final email = _repository.getEmail();

    if (email == null) {
      state = state.copyWith(
        verifyCodeResponse: AsyncValue.error(
          "Emtpy Email Address",
          StackTrace.current,
        ),
      );
      return;
    }

    state = state.copyWith(sendCodeResponse: const AsyncValue.loading());

    final response = await _repository.sendOtp(email: email);
    if (response is DataSuccess) {
      state = state.copyWith(
        sendCodeResponse: const AsyncValue.data(
          "Verification OTP Email Sent, Please Check Your Inbox!",
        ),
      );
    } else {
      state = state.copyWith(
        sendCodeResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> verifyOTP({required String otp}) async {
    final email = _repository.getEmail();

    if (email?.isEmpty ?? true) {
      return;
    }

    state = state.copyWith(verifyCodeResponse: const AsyncValue.loading());

    if (email == null) {
      state = state.copyWith(
        verifyCodeResponse: AsyncValue.error(
          "Emtpy Email Address",
          StackTrace.current,
        ),
      );
      return;
    }

    final response = await _repository.verifyOtp(email: email, otp: otp);
    if (response is DataSuccess) {
      state = state.copyWith(
        verifyCodeResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        verifyCodeResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
