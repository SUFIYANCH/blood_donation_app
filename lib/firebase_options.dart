// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDAjB-phiSd2mkl1NUUMBsAWUW4cAJAgFQ',
    appId: '1:343994930605:web:1278baa25669e7573b7d24',
    messagingSenderId: '343994930605',
    projectId: 'blooddonationapp-a005e',
    authDomain: 'blooddonationapp-a005e.firebaseapp.com',
    storageBucket: 'blooddonationapp-a005e.appspot.com',
    measurementId: 'G-P1X0L7GR29',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh59snVPemlc2veGv_WuZVuTeMRj705uI',
    appId: '1:343994930605:android:f0723eb34bb0be603b7d24',
    messagingSenderId: '343994930605',
    projectId: 'blooddonationapp-a005e',
    storageBucket: 'blooddonationapp-a005e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARWSUqepbqVvE3aXOIWt4ou40pgeA9NSc',
    appId: '1:343994930605:ios:7d7c424efa5d8a4e3b7d24',
    messagingSenderId: '343994930605',
    projectId: 'blooddonationapp-a005e',
    storageBucket: 'blooddonationapp-a005e.appspot.com',
    iosClientId: '343994930605-om22e4l327a59tv8iq0ovd2v1tbcitrt.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARWSUqepbqVvE3aXOIWt4ou40pgeA9NSc',
    appId: '1:343994930605:ios:7d7c424efa5d8a4e3b7d24',
    messagingSenderId: '343994930605',
    projectId: 'blooddonationapp-a005e',
    storageBucket: 'blooddonationapp-a005e.appspot.com',
    iosClientId: '343994930605-om22e4l327a59tv8iq0ovd2v1tbcitrt.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );
}