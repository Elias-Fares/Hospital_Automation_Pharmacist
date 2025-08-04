import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddResidentialAddressState {
  final AsyncValue? addAddressResponse;
  final bool agreeCheckBox;

  AddResidentialAddressState({
    this.addAddressResponse,
    required this.agreeCheckBox,
  });

  AddResidentialAddressState copyWith({
    AsyncValue? addAddressResponse,
    bool? agreeCheckBox,
  }) {
    return AddResidentialAddressState(
      addAddressResponse: addAddressResponse ?? this.addAddressResponse,
      agreeCheckBox: agreeCheckBox ?? this.agreeCheckBox,
    );
  }
}
