import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';


Future<bool> checkStoragePermisson() async {
  if (Platform.isIOS) {
    // On iOS, use photos permission
    var status = await Permission.photos.status;
    if (status.isGranted) return true;
    return (await Permission.photos.request()).isGranted;
  } else {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    if (androidInfo.version.sdkInt >= 33) {
      // For Android 13+, request media-specific permissions
      final videosGranted = await Permission.videos.isGranted || await Permission.videos.request().isGranted;
      final photosGranted = await Permission.photos.isGranted || await Permission.photos.request().isGranted;
      final audioGranted = await Permission.audio.isGranted || await Permission.audio.request().isGranted;

      return videosGranted && photosGranted && audioGranted;
    } else {
      // For Android < 13, request storage
      final storageGranted = await Permission.storage.isGranted || await Permission.storage.request().isGranted;
      return storageGranted;
    }
  }
}
