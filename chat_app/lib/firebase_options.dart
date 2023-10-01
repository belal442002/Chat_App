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
    apiKey: 'AIzaSyAMHvj7w90_cXfdhgjFx-ihBBZZ20f7mtA',
    appId: '1:966726102176:web:dcb160a457815f94a0edc5',
    messagingSenderId: '966726102176',
    projectId: 'chat-app-d8df5',
    authDomain: 'chat-app-d8df5.firebaseapp.com',
    storageBucket: 'chat-app-d8df5.appspot.com',
    measurementId: 'G-Q6ZMZZDC62',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIsgIqV8agP6tw8VBHXuGhRG0splwQwqg',
    appId: '1:966726102176:android:991fdb0dcd8e32d9a0edc5',
    messagingSenderId: '966726102176',
    projectId: 'chat-app-d8df5',
    storageBucket: 'chat-app-d8df5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP95F7xEt7a-ugDRcURX19NaEQ61PsHfk',
    appId: '1:966726102176:ios:7fdb86e8437d28e2a0edc5',
    messagingSenderId: '966726102176',
    projectId: 'chat-app-d8df5',
    storageBucket: 'chat-app-d8df5.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP95F7xEt7a-ugDRcURX19NaEQ61PsHfk',
    appId: '1:966726102176:ios:18caeba7b42f09a2a0edc5',
    messagingSenderId: '966726102176',
    projectId: 'chat-app-d8df5',
    storageBucket: 'chat-app-d8df5.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
