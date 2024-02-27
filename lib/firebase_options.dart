// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
///
///
///
///
class DefaultFirebaseOptions {
  static Future<FirebaseOptions> get currentPlatform async {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpex-BkcORTLTSEkDyezRHe1BZtNDVT20',
    appId: '1:397350003569:android:8c31de8f28c99821930cd0',
    messagingSenderId: '397350003569',
    projectId: 'petpals-d4590',
    storageBucket: 'petpals-d4590.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLCEIE8T7Z8HTDe3RvMUzYC5oBL9BfyO8',
    appId: '1:397350003569:ios:cb86293baf87d0fa930cd0',
    messagingSenderId: '397350003569',
    projectId: 'petpals-d4590',
    storageBucket: 'petpals-d4590.appspot.com',
    iosClientId:
        '397350003569-qake4dcjh46dss7ar5spsckafbm6rmp6.apps.googleusercontent.com',
    iosBundleId: 'com.petpals.petpals',
  );
}
