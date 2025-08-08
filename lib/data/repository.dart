import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/remote_data_source.dart';

class Repository {
  final RemoteDataSource _remoteDataSource;

  Repository({required RemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

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
    final response = await _remoteDataSource.signUp(
      role: role,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      phoneNumber: phoneNumber,
      gender: gender,
    );

    return response;
  }

  Future<DataState> sendOtp({required String email}) async {
    final response = await _remoteDataSource.sendOtp(email: email);

    return response;
  }

  Future<DataState> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _remoteDataSource.verifyOtp(email: email, otp: otp);

    return response;
  }

  Future<DataState> resetPassword({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.resetPassword(
      email: email,
      password: password,
    );

    return response;
  }

  Future<DataState> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );

    return response;
  }

  Future<DataState> logout() async {
    final response = await _remoteDataSource.logout();

    return response;
  }

  Future<DataState> deleteAccount() async {
    final response = await _remoteDataSource.deleteAccount();

    return response;
  }

  Future<DataState> translateService({required String msg}) async {
    final response = await _remoteDataSource.translateService(msg: msg);

    return response;
  }

  Future<DataState> addAddress({
    required String addressGovernorate,
    required String addressCity,
    required String addressRegion,
    required String addressStreet,
    required String addressNote,
  }) async {
    final response = await _remoteDataSource.addAddress(
      addressGovernorate: addressGovernorate,
      addressCity: addressCity,
      addressRegion: addressRegion,
      addressStreet: addressStreet,
      addressNote: addressNote,
    );

    return response;
  }

  Future<DataState> uploadFile() async {
    final response = await _remoteDataSource.uploadFile();

    return response;
  }

  Future<DataState> addImage() async {
    final response = await _remoteDataSource.addImage();

    return response;
  }

  Future<DataState> userPermissions() async {
    final response = await _remoteDataSource.userPermissions();

    return response;
  }

  Future<DataState> deactivateAccount({
    required String deactivationReason,
  }) async {
    final response = await _remoteDataSource.deactivateAccount(
      deactivationReason: deactivationReason,
    );

    return response;
  }

  Future<DataState> reactivateAccount() async {
    final response = await _remoteDataSource.reactivateAccount();

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
    final response = await _remoteDataSource.addPharmacy(
      name: name,
      addressGovernorate: addressGovernorate,
      addressCity: addressCity,
      addressRegion: addressRegion,
      addressStreet: addressStreet,
      addressNote: addressNote,
      phonenumber: phonenumber,
    );

    return response;
  }

  Future<DataState> showPhProfile() async {
    final response = await _remoteDataSource.showPhProfile();

    return response;
  }

  Future<DataState> editprofilecopy() async {
    final response = await _remoteDataSource.editprofilecopy();

    return response;
  }

  Future<DataState> addMedicine() async {
    final response = await _remoteDataSource.addMedicine();

    return response;
  }

  Future<DataState> addExistedMedicine({
    required String expiredDate,
    required String lowbound,
    required String quantity,
  }) async {
    final response = await _remoteDataSource.addExistedMedicine(
      expiredDate: expiredDate,
      lowbound: lowbound,
      quantity: quantity,
    );

    return response;
  }

  Future<DataState> getMedicineDetailsByBarcode({
    required String barcode,
  }) async {
    final response = await _remoteDataSource.getMedicineDetailsByBarcode(
      barcode: barcode,
    );

    return response;
  }

  Future<DataState> searchForMedicine({required String name}) async {
    final response = await _remoteDataSource.searchForMedicine(name: name);

    return response;
  }

  Future<DataState> showAllMedicines() async {
    final response = await _remoteDataSource.showAllMedicines();

    return response;
  }

  Future<DataState> deleteFromMyPharmacy() async {
    final response = await _remoteDataSource.deleteFromMyPharmacy();

    return response;
  }

  Future<DataState> updatePricePercentage() async {
    final response = await _remoteDataSource.updatePricePercentage();

    return response;
  }

  Future<DataState> saleProcessAmount() async {
    final response = await _remoteDataSource.saleProcessAmount();

    return response;
  }

  Future<DataState> addBatch({
    required String quantity,
    required String expiredDate,
  }) async {
    final response = await _remoteDataSource.addBatch(
      quantity: quantity,
      expiredDate: expiredDate,
    );

    return response;
  }

  Future<DataState> despenseMedicine() async {
    final response = await _remoteDataSource.despenseMedicine();

    return response;
  }

  Future<DataState> workDaysProcesses() async {
    final response = await _remoteDataSource.workDaysProcesses();

    return response;
  }

  Future<DataState> searchprescription({
    required String code,
    required String view,
  }) async {
    final response = await _remoteDataSource.searchprescription(
      code: code,
      view: view,
    );

    return response;
  }

  Future<DataState> medicineAndAlternatives() async {
    final response = await _remoteDataSource.medicineAndAlternatives();

    return response;
  }

  Future<DataState> addAlternatives() async {
    final response = await _remoteDataSource.addAlternatives();

    return response;
  }

  Future<DataState> showOrders() async {
    final response = await _remoteDataSource.showOrders();

    return response;
  }

  Future<DataState> dailyInventory() async {
    final response = await _remoteDataSource.dailyInventory();

    return response;
  }

  Future<DataState> markedAsBought({required String count}) async {
    final response = await _remoteDataSource.markedAsBought(count: count);

    return response;
  }

  Future<DataState> updateMedicineDetails({
    required String name,
    required String pharmaceuticaltiter,
    required String pharmaceuticalindications,
    required String pharmaceuticalcomposition,
    required String companyName,
    required String price,
    required String isallowedwithoutprescription,
    required String barcode,
  }) async {
    final response = await _remoteDataSource.updateMedicineDetails(
      name: name,
      pharmaceuticaltiter: pharmaceuticaltiter,
      pharmaceuticalindications: pharmaceuticalindications,
      pharmaceuticalcomposition: pharmaceuticalcomposition,
      companyName: companyName,
      price: price,
      isallowedwithoutprescription: isallowedwithoutprescription,
      barcode: barcode,
    );

    return response;
  }

  Future<DataState> maximinMinimumSellings() async {
    final response = await _remoteDataSource.maximinMinimumSellings();

    return response;
  }

  Future<DataState> monthlyRevenu({required String date}) async {
    final response = await _remoteDataSource.monthlyRevenu(date: date);

    return response;
  }

  Future<DataState> lowBound({required String fcmtoken}) async {
    final response = await _remoteDataSource.lowBound(fcmtoken: fcmtoken);

    return response;
  }

  Future<DataState> expiredDate({required String fcmtoken}) async {
    final response = await _remoteDataSource.expiredDate(fcmtoken: fcmtoken);

    return response;
  }

  Future<DataState> dynamicNotification({
    required String fcmtoken,
    required String title,
    required String body,
  }) async {
    final response = await _remoteDataSource.dynamicNotification(
      fcmtoken: fcmtoken,
      title: title,
      body: body,
    );

    return response;
  }
}
