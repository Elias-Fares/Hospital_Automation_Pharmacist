import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermisson() async {
  if (Platform.isIOS) {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      return (await Permission.storage.request()).isGranted;
    }
  } else {
    bool storage = false;
    bool videos = false;
    bool photos = false;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      videos = (await Permission.videos.status).isGranted;
      photos = (await Permission.photos.status).isGranted;
      if (videos && photos) {
        return true;
      } else {
        videos = await (Permission.videos.request()).isGranted;
        photos = await (Permission.photos.request()).isGranted;
        // photos = await (Permission.photos.request()).isGranted;
        return (videos && photos);
      }
    } else {
      storage = (await Permission.storage.status).isGranted;
      if (storage) {
        return true;
      } else {
        storage = await (Permission.storage.request()).isGranted;
        return storage;
      }
    }
  }
}