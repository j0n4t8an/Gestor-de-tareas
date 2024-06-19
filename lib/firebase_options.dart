// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBudQDrBAhRLGNQnqZfa7D2Rr-T-_bTaWw',
    appId: '1:876083870170:web:3366bacc9d156bee80e8e3',
    messagingSenderId: '876083870170',
    projectId: 'gestordetareas-6317a',
    authDomain: 'gestordetareas-6317a.firebaseapp.com',
    storageBucket: 'gestordetareas-6317a.appspot.com',
    measurementId: 'G-PTJHBG5CB3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUchcvCBxr1iovICiqpgpcdyHsGJw3ANU',
    appId: '1:876083870170:android:6311991256790ba280e8e3',
    messagingSenderId: '876083870170',
    projectId: 'gestordetareas-6317a',
    storageBucket: 'gestordetareas-6317a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbYkaJudkogiANHRl2MFBylrsNuyCu1nY',
    appId: '1:876083870170:ios:bdc89987f6f600aa80e8e3',
    messagingSenderId: '876083870170',
    projectId: 'gestordetareas-6317a',
    storageBucket: 'gestordetareas-6317a.appspot.com',
    iosBundleId: 'com.example.gestionTareas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbYkaJudkogiANHRl2MFBylrsNuyCu1nY',
    appId: '1:876083870170:ios:bdc89987f6f600aa80e8e3',
    messagingSenderId: '876083870170',
    projectId: 'gestordetareas-6317a',
    storageBucket: 'gestordetareas-6317a.appspot.com',
    iosBundleId: 'com.example.gestionTareas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBudQDrBAhRLGNQnqZfa7D2Rr-T-_bTaWw',
    appId: '1:876083870170:web:ed21d202b7dbb5ed80e8e3',
    messagingSenderId: '876083870170',
    projectId: 'gestordetareas-6317a',
    authDomain: 'gestordetareas-6317a.firebaseapp.com',
    storageBucket: 'gestordetareas-6317a.appspot.com',
    measurementId: 'G-T1DEM9V4LB',
  );

}