import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyCodeState {
  final AsyncValue? sendCodeResponse;
  final AsyncValue? verifyCodeResponse;

  VerifyCodeState({
     this.sendCodeResponse,
     this.verifyCodeResponse,
  });

  VerifyCodeState copyWith({
    AsyncValue? sendCodeResponse,
    AsyncValue? verifyCodeResponse,
  }) {
    return VerifyCodeState(
      sendCodeResponse: sendCodeResponse ?? this.sendCodeResponse,
      verifyCodeResponse: verifyCodeResponse ?? this.verifyCodeResponse,
    );
  }
}
