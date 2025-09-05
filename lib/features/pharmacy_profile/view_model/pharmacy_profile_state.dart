part of 'pharmacy_profile_view_model.dart';

class PharmacyProfileState {
  final AsyncValue<ProfileModel>? pharmacyDetailsResponse;
  final AsyncValue? deactivateAccount;

  PharmacyProfileState({this.pharmacyDetailsResponse, this.deactivateAccount});

  PharmacyProfileState copyWith({
    AsyncValue<ProfileModel>? pharmacyDetailsResponse,
    AsyncValue? deactivateAccount
  }) => PharmacyProfileState(
    pharmacyDetailsResponse:
        pharmacyDetailsResponse ?? this.pharmacyDetailsResponse,

        deactivateAccount: deactivateAccount ?? this.deactivateAccount
  );
}
