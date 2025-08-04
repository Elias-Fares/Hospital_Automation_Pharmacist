part of 'pharmacy_profile_view_model.dart';

class PharmacyProfileState {
  final AsyncValue<PharmacyDetailsModel>? pharmacyDetailsResponse;

  PharmacyProfileState({this.pharmacyDetailsResponse});

  PharmacyProfileState copyWith(
          {AsyncValue<PharmacyDetailsModel>? pharmacyDetailsResponse}) =>
      PharmacyProfileState(
          pharmacyDetailsResponse:
              pharmacyDetailsResponse ?? this.pharmacyDetailsResponse);
}
