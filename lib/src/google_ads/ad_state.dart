/* ****************************************************************************
 * Copyright (c) 2022 flognity
 * This code was written by flognity (Florian Wilhelm)
 * If distributed, this comment shall be included in all copies the Software.
***************************************************************************** */
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  /// iOS test unit IDs can be found here:
  /// https://developers.google.com/admob/ios/test-ads?hl=en-GB
  /// Android test unit IDs can be found here:
  /// https://developers.google.com/admob/android/test-ads?hl=en-GB#enable_test_devices
  String get bannerAdUnitIdDiceScreen => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111' //Android Banner Test unit ID
      : 'ca-app-pub-3940256099942544/2934735716'; //iOS Banner Test unit ID

  BannerAdListener get bannerAdListener => _bannerAdListener;

  final BannerAdListener _bannerAdListener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );
}
