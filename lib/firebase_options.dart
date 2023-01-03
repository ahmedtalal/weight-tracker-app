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
    apiKey: 'AIzaSyBxfvyufUh-pnWp8zImsEM5FTMTR4tYUL8',
    appId: '1:1038197471443:web:e97010965140162a1afc26',
    messagingSenderId: '1038197471443',
    projectId: 'weight-tracker-37024',
    authDomain: 'weight-tracker-37024.firebaseapp.com',
    storageBucket: 'weight-tracker-37024.appspot.com',
    measurementId: 'G-3ZKYY9DTN2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5XvSgqKSnj5ESTCUhQgVArd19vvF0M-w',
    appId: '1:1038197471443:android:847e7a99881047151afc26',
    messagingSenderId: '1038197471443',
    projectId: 'weight-tracker-37024',
    storageBucket: 'weight-tracker-37024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTmJhwLhSAIlJl5aiCdpSba5U_pj8UQDQ',
    appId: '1:1038197471443:ios:60bb00efe95b03c01afc26',
    messagingSenderId: '1038197471443',
    projectId: 'weight-tracker-37024',
    storageBucket: 'weight-tracker-37024.appspot.com',
    iosClientId: '1038197471443-7jkrjf1ojl703440q267udp8kb8cjhpj.apps.googleusercontent.com',
    iosBundleId: 'ahmed.trackerApp.weightTrackerTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTmJhwLhSAIlJl5aiCdpSba5U_pj8UQDQ',
    appId: '1:1038197471443:ios:60bb00efe95b03c01afc26',
    messagingSenderId: '1038197471443',
    projectId: 'weight-tracker-37024',
    storageBucket: 'weight-tracker-37024.appspot.com',
    iosClientId: '1038197471443-7jkrjf1ojl703440q267udp8kb8cjhpj.apps.googleusercontent.com',
    iosBundleId: 'ahmed.trackerApp.weightTrackerTask',
  );
}
