// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCjQxVEGjGd9h1qR1l1C3NcrVhaxfyBYpY',
    appId: '1:260321087125:web:375c18c3e0f7dfb989959c',
    messagingSenderId: '260321087125',
    projectId: 'kitaro-4ffe4',
    authDomain: 'kitaro-4ffe4.firebaseapp.com',
    databaseURL: 'https://kitaro-4ffe4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kitaro-4ffe4.appspot.com',
    measurementId: 'G-0NFZHJBKGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIuohiWYY6fdLBnDRYc0dwlmvUSvJBaMg',
    appId: '1:260321087125:android:88a9dc13fc60236189959c',
    messagingSenderId: '260321087125',
    projectId: 'kitaro-4ffe4',
    databaseURL: 'https://kitaro-4ffe4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kitaro-4ffe4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClKPqh5S_9nhk81mitmazPcG7op6WXnbE',
    appId: '1:260321087125:ios:9ed4de3160d5a99789959c',
    messagingSenderId: '260321087125',
    projectId: 'kitaro-4ffe4',
    databaseURL: 'https://kitaro-4ffe4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kitaro-4ffe4.appspot.com',
    androidClientId: '260321087125-c0aea0gkr3dvie21e74jk0dk0uf0ns6a.apps.googleusercontent.com',
    iosClientId: '260321087125-orn0am8foqar53q7mu1p82ei9898lcnp.apps.googleusercontent.com',
    iosBundleId: 'com.worldwide.',
  );
}
