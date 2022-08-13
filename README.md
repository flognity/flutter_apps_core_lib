# flutter_apps_core_lib
Flutter library to include some common core components across multiple apps
## How to clone
Since this submodule itself contains a gist as a submodule, the easiest way to clone this repository is:
```
git clone --recurse-submodules https://github.com/flognity/flutter_apps_core_lib.git
```
## How to install
This repository is meant to be a included as a library to flutter apps. Just place the library in the same root folder where your app is located (e.g. your flutter app is in `src/YourApp` then place the library in `src/flutter_apps_core_lib`). Simply add the dependency in your flutter project:
```
dependencies:
  flutter_apps_core_lib:
    path: ../flutter_apps_core_lib/
```
## 1. app_theme
Submodule to generate a unique app theme across all flutter apps. By setting the ThemeData of a MaterialApp, a consistent look is achieved.

### How to use
Simply include the ThemeData in your MaterialApp Constructor call:
```
AppTheme appTheme = AppTheme();

MaterialApp(
      theme: appTheme.getTheme(isDarkTheme: false),
      darkTheme: appTheme.getTheme(isDarkTheme: true),
      //...
    );
```

## 2. google_ads
Submodule for Google Ads for flutter projects with AdMob

### Prerequisites
You must have linked your google Funding Choices account to your Admob account.

### How to use
Add the AdMob App ID to the app's android/app/src/main/AndroidManifest.xml file
```
 <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
```

Update your app's ios/Runner/Info.plist file to add two keys:
- A GADApplicationIdentifier key with a string value of your AdMob app ID.
- A SKAdNetworkItems key with Google's SKAdNetworkIdentifier value of cstr6suwn9.skadnetwork.
```
<key>GADApplicationIdentifier</key>
<string>YOUR-APP-ID</string>
<key>SKAdNetworkItems</key>
  <array>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>cstr6suwn9.skadnetwork</string>
    </dict>
  </array>
<key>NSUserTrackingUsageDescription</key>
<string>This identifier will be used to deliver personalized ads to you.</string>
```

Initialize the Mobile Ads SDK before the App is run, by placing the initializer before the runApp instruction. Wrap your App in the UserConsentWrapper to include the user consent form:
```
import './util/google_ads/ad_state.dart';
import './util/google_ads/user_messaging_platform.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<InitializationStatus> initFuture =
      MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => UserConsentWrapper(
        child: YourMaterialApp(),
      ),
    ),
  );
}

```

## License
MIT License

Copyright (c) 2022 flognity
