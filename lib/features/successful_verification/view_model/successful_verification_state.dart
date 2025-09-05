part of 'successful_verification_view_model.dart';

class SuccessfulVerificationState {
  final AsyncValue? autoLoginReposne;

  SuccessfulVerificationState({ this.autoLoginReposne});

  SuccessfulVerificationState copyWith({AsyncValue? autoLoginReposne}) {
    return SuccessfulVerificationState(
      autoLoginReposne: autoLoginReposne ?? this.autoLoginReposne,
    );
  }
}
