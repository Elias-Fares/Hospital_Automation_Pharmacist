part of 'add_pharmacy_address_view_model.dart';
class AddPharmacyAddressState {
  final AsyncValue? addAddressResponse;
  final bool agreeCheckBox;

  AddPharmacyAddressState({
    this.addAddressResponse,
    required this.agreeCheckBox,
  });

  AddPharmacyAddressState copyWith({
    AsyncValue? addAddressResponse,
    bool? agreeCheckBox,
  }) {
    return AddPharmacyAddressState(
      addAddressResponse: addAddressResponse ?? this.addAddressResponse,
      agreeCheckBox: agreeCheckBox ?? this.agreeCheckBox,
    );
  }
}
