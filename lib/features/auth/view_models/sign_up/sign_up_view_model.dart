import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';
import '../../../../core/enums/gender_enum.dart';

import 'sign_up_state.dart';
import '../verify_code/verify_code_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => SignUpState(
    isConfirmPasswordVisible: false,
    isPasswordVisible: false,
    selectedGender: GenderEnum.male,
  );

  // final _authRepository = getIt<AuthRepository>();

  void togglePasswordVisibility() {
    // state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String middleName,
    required String password,
    required String phoneNumber,
  }) async {
    // state = state.copyWith(signUpResponse: const AsyncValue.loading());

    // final response = await _authRepository.signUp(
    //     email: email,
    //     firstName: firstName,
    //     lastName: lastName,
    //     middleName: middleName,
    //     password: password,
    //     phoneNumber: phoneNumber,
    //     gender: state.selectedGender.getTitle());
    // if (response is DataSuccess) {
    //   state = state.copyWith(signUpResponse: AsyncValue.data(response.data));
    //   await _authRepository.saveEmail(email: email);
    //   await _authRepository.savePassword(password: password);

    //   ref.read(verifyCodeViewModelProvider.notifier).sendOTP();
    // } else {
    //   state = state.copyWith(
    //       signUpResponse: AsyncValue.error(
    //           response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
    //           StackTrace.current));
    // }
  }

  void setGender(GenderEnum gender) {
    state = state.copyWith(selectedGender: gender);
  }
}
