import 'dart:io';

class AdHelpers {
  static String get bannerAddUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6047951199275814/6173620902";
    } else {
      throw UnsupportedError('Not SUpport');
    }
  }

  static String get interstitialAddUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6047951199275814/6173620902";
    } else {
      throw UnsupportedError('Not SUpport');
    }
  }
}
