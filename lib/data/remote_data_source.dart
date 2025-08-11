import 'package:dio/dio.dart';
import 'package:medicare_pharmacy/core/base_dio/base_dio.dart' show BaseDio;
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_with_alts_model.dart';

class RemoteDataSource {
  final BaseDio baseDio;

  RemoteDataSource({required this.baseDio});

  Future<DataState> signUp({
    required String role,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String gender,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/sign-up",
      data: {
        "role": role,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "phone_number": phoneNumber,
        "gender": gender,
      },
    );

    return response;
  }

  Future<DataState> sendOtp({required String email}) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/send-otp",
      data: {"email": email},
    );

    return response;
  }

  Future<DataState> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/verify-otp",
      data: {"email": email, "otp": otp},
    );

    return response;
  }

  Future<DataState> resetPassword({
    required String email,
    required String password,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/reset-password",
      data: {"email": email, "password": password},
    );

    return response;
  }

  Future<DataState> login({
    required String email,
    required String password,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/login",
      data: {"email": email, "password": password},
    );

    return response;
  }

  Future<DataState> logout() async {
    final response = await baseDio.post(subUrl: "/pharmacist/logout");

    return response;
  }

  Future<DataState> deleteAccount() async {
    final response = await baseDio.delete(subUrl: "/pharmacist/delete-account");

    return response;
  }

  Future<DataState> translateService({required String msg}) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/translate-service",
      data: {"msg": msg},

      model: dynamic,
    );

    return response;
  }

  Future<DataState> addAddress({
    required String addressGovernorate,
    required String addressCity,
    required String addressRegion,
    required String addressStreet,
    required String addressNote,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/add-address",
      data: {
        "address_governorate": addressGovernorate,
        "address_city": addressCity,
        "address_region": addressRegion,
        "address_street": addressStreet,
        "address_note": addressNote,
      },
    );

    return response;
  }

  Future<DataState> uploadFile() async {
    final response = await baseDio.post(subUrl: "/pharmacist/upload-file");

    return response;
  }

  Future<DataState> addImage() async {
    final response = await baseDio.post(subUrl: "/pharmacist/add-image");

    return response;
  }

  Future<DataState> userPermissions() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/user-permissions",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> deactivateAccount({
    required String deactivationReason,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/deactivate-account",
      data: {"deactivation_reason": deactivationReason},
    );

    return response;
  }

  Future<DataState> reactivateAccount() async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/reactivate-account",
    );

    return response;
  }

  Future<DataState> addPharmacy({
    required String name,
    required String addressGovernorate,
    required String addressCity,
    required String addressRegion,
    required String addressStreet,
    required String addressNote,
    required String phonenumber,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/add-pharmacy",
      data: {
        "name": name,
        "address_governorate": addressGovernorate,
        "address_city": addressCity,
        "address_region": addressRegion,
        "address_street": addressStreet,
        "address_note": addressNote,
        "phoneNumber": phonenumber,
      },
    );

    return response;
  }

  Future<DataState> showPhProfile() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/show-profile",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> editprofilecopy() async {
    final response = await baseDio.post(subUrl: "/employee/edit-profile");

    return response;
  }

  Future<DataState> addMedicine() async {
    final response = await baseDio.post(subUrl: "/pharmacist/add-medicine");

    return response;
  }

  Future<DataState> addExistedMedicine({
    required String expiredDate,
    required String lowbound,
    required String quantity,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/add-existed-medicine/3",
      data: {
        "expired_date": expiredDate,
        "lowbound": lowbound,
        "quantity": quantity,
      },
    );

    return response;
  }

  Future<DataState> getMedicineDetailsByBarcode({
    required String barcode,
  }) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/get-medicine-details-by-barcode",

      queryParameters: {"barcode": barcode},
      model: dynamic,
    );

    return response;
  }

  Future<DataState> searchForMedicine({required String name}) async {
    final queryMap = <String, dynamic>{};
    if (name.isNotEmpty) {
      queryMap["name"] = name;
    }
    final response = await baseDio.get<MedicineModel>(
      subUrl: "/pharmacist/search-for-medicine",
      isListOfModel: true,
      needToken: true,

      queryParameters: queryMap,
      model: MedicineModel(),
    );

    return response;
  }

  Future<DataState> showAllMedicines() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/show-all-medicines",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> deleteFromMyPharmacy({required String medId}) async {
    final response = await baseDio.delete(
      subUrl: "/pharmacist/delete-from-my-pharmacy/$medId",
    );

    return response;
  }

  Future<DataState> updatePricePercentage() async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/update-price-percentage",
    );

    return response;
  }

  Future<DataState> saleProcessAmount() async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/sale-process-amount",
    );

    return response;
  }

  Future<DataState> addBatch({
    required String quantity,
    required String expiredDate,
    required String medId,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/add-batch/$medId",
      data: {"quantity": quantity, "expired_date": expiredDate},
    );

    return response;
  }

  Future<DataState> despenseMedicine() async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/despense-medicine/1",
    );

    return response;
  }

  Future<DataState> workDaysProcesses() async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/work-days-processes",
    );

    return response;
  }

  Future<DataState> searchprescription({
    required String code,
    required String view,
  }) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/searchPrescription",

      queryParameters: {"code": code, "view": view},
      model: dynamic,
    );

    return response;
  }

  Future<DataState> medicineAndAlternatives({required String medId}) async {
    final response = await baseDio.get<MedicineWithAltsModel>(
      subUrl: "/pharmacist/medicine-and-alternatives/$medId",
      needToken: true,

      model: MedicineWithAltsModel(),
    );

    return response;
  }

  Future<DataState> addAlternatives({
    required String medicineId,
    required String altMedId,
  }) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/add-alternatives/$medicineId",
      queryParameters: {"alternative": altMedId},
    );

    return response;
  }

  Future<DataState> showOrders() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/show-orders",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> dailyInventory() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/daily-inventory",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> markedAsBought({required String count}) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/marked-as-bought/1",
      data: {"count": count},
    );

    return response;
  }

  Future<DataState> updateMedicineDetails({
    required String medId,
    required String name,
    required String pharmaceuticaltiter,
    required String pharmaceuticalindications,
    required String pharmaceuticalcomposition,
    required String companyName,
    required String price,
    required String imagePath,
    required bool isallowedwithoutprescription,
    // required String barcode,
  }) async {
    FormData formData;

    final bodyMap = {
      "name": name,
      "pharmaceuticalTiter": pharmaceuticaltiter,
      "pharmaceuticalIndications": pharmaceuticalindications,
      "pharmaceuticalComposition": pharmaceuticalcomposition,
      "company_Name": companyName,
      "price": price,
      "isAllowedWithoutPrescription": isallowedwithoutprescription,
    };

    if (imagePath.isNotEmpty) {
      bodyMap['image'] = await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split("/").last,
      );
    }

    formData = FormData.fromMap(bodyMap);
    final response = await baseDio.post(
      subUrl: "/pharmacist/update-medicine-details/$medId",
      data: formData,
    );

    return response;
  }

  Future<DataState> maximinMinimumSellings() async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/maximin-minimum-sellings",

      model: dynamic,
    );

    return response;
  }

  Future<DataState> monthlyRevenu({required String date}) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/monthly-revenu",

      queryParameters: {"date": date},
      model: dynamic,
    );

    return response;
  }

  Future<DataState> lowBound({required String fcmtoken}) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/low-bound",
      data: {"fcmToken": fcmtoken},

      model: dynamic,
    );

    return response;
  }

  Future<DataState> expiredDate({required String fcmtoken}) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/expired-date",
      data: {"fcmToken": fcmtoken},

      model: dynamic,
    );

    return response;
  }

  Future<DataState> dynamicNotification({
    required String fcmtoken,
    required String title,
    required String body,
  }) async {
    final response = await baseDio.get(
      subUrl: "/pharmacist/dynamic-notification",
      data: {"fcmToken": fcmtoken, "title": title, "body": body},

      model: dynamic,
    );

    return response;
  }

  Future<DataState> detach({required String id}) async {
    final response = await baseDio.post(
      subUrl: "/pharmacist/detach/$id",
      needToken: true,
    );

    return response;
  }
}
