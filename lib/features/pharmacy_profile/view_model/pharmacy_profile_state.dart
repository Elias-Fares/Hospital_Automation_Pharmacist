part of 'pharmacy_profile_view_model.dart';

class PharmacyProfileState {
  final AsyncValue<ProfileModel>? pharmacyDetailsResponse;

  PharmacyProfileState({this.pharmacyDetailsResponse});

  PharmacyProfileState copyWith({
    AsyncValue<ProfileModel>? pharmacyDetailsResponse,
  }) => PharmacyProfileState(
    pharmacyDetailsResponse:
        pharmacyDetailsResponse ?? this.pharmacyDetailsResponse,
  );
}
