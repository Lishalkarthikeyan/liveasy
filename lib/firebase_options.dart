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
    apiKey: 'AIzaSyDtEEjEaXRffJpk33CvIKlvkO0mlGY0BdE',
    appId: '1:402111923276:web:6e809a6f7fb8a0b43060e9',
    messagingSenderId: '402111923276',
    projectId: 'liveasy001',
    authDomain: 'liveasy001.firebaseapp.com',
    storageBucket: 'liveasy001.appspot.com',
    measurementId: 'G-3PN211WSTL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7rJnfWDh6F34A6A0huPRvNjpmg-8Ow1g',
    appId: '1:402111923276:android:cb35d84dc5bfd59e3060e9',
    messagingSenderId: '402111923276',
    projectId: 'liveasy001',
    storageBucket: 'liveasy001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAW6FhXFtAO9MCT4OWX1_yCFKQSjKWzymo',
    appId: '1:402111923276:ios:21e1f24f46342e5b3060e9',
    messagingSenderId: '402111923276',
    projectId: 'liveasy001',
    storageBucket: 'liveasy001.appspot.com',
    iosBundleId: 'com.example.liveasy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAW6FhXFtAO9MCT4OWX1_yCFKQSjKWzymo',
    appId: '1:402111923276:ios:21e1f24f46342e5b3060e9',
    messagingSenderId: '402111923276',
    projectId: 'liveasy001',
    storageBucket: 'liveasy001.appspot.com',
    iosBundleId: 'com.example.liveasy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDtEEjEaXRffJpk33CvIKlvkO0mlGY0BdE',
    appId: '1:402111923276:web:8a63271df772868c3060e9',
    messagingSenderId: '402111923276',
    projectId: 'liveasy001',
    authDomain: 'liveasy001.firebaseapp.com',
    storageBucket: 'liveasy001.appspot.com',
    measurementId: 'G-LPZY3BVPJE',
  );
}