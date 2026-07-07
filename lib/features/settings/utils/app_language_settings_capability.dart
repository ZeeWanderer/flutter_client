import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const int _kMinAndroidSdkForAppLocale = 33;

/// Returns whether the OS exposes a per-app language settings screen.
///
/// Android: requires API 33 (Android 13).
/// iOS: always available.
Future<bool> isAppLanguageSettingsSupported() async {
  if (kIsWeb) {
    return false;
  }
  if (Platform.isIOS) {
    return true;
  }
  if (Platform.isAndroid) {
    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    final AndroidDeviceInfo info = await plugin.androidInfo;
    return info.version.sdkInt >= _kMinAndroidSdkForAppLocale;
  }
  return false;
}
