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
    apiKey: 'AIzaSyAcfCAO7XQYLGvU_vYG70rqjOWmsHUg8AY',
    appId: '1:2496452726:web:448f61a505423af35b2757',
    messagingSenderId: '2496452726',
    projectId: 'e-commerce-app-ccf40',
    authDomain: 'e-commerce-app-ccf40.firebaseapp.com',
    storageBucket: 'e-commerce-app-ccf40.appspot.com',
    measurementId: 'G-JQHV5TPGMQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR2ZAHGUXfGJBlC3zdli14GTOSU9IEIFQ',
    appId: '1:2496452726:android:1450c9268a80b8495b2757',
    messagingSenderId: '2496452726',
    projectId: 'e-commerce-app-ccf40',
    storageBucket: 'e-commerce-app-ccf40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQdt3ohQCvVeO5Jq0uOnM6UIk8jHFi3sQ',
    appId: '1:2496452726:ios:015b08558881f3f75b2757',
    messagingSenderId: '2496452726',
    projectId: 'e-commerce-app-ccf40',
    storageBucket: 'e-commerce-app-ccf40.appspot.com',
    iosClientId:
        '2496452726-3lu9k0rddot84i105enmbsv5ln4q0olk.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQdt3ohQCvVeO5Jq0uOnM6UIk8jHFi3sQ',
    appId: '1:2496452726:ios:015b08558881f3f75b2757',
    messagingSenderId: '2496452726',
    projectId: 'e-commerce-app-ccf40',
    storageBucket: 'e-commerce-app-ccf40.appspot.com',
    iosClientId:
        '2496452726-3lu9k0rddot84i105enmbsv5ln4q0olk.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );
}
