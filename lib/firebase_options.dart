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
    apiKey: 'AIzaSyCJimM_J7ryauGQ6rsXSBo73DxyTBnzidE',
    appId: '1:157091448589:web:a2f807da06d76587eb5244',
    messagingSenderId: '157091448589',
    projectId: 'news-d048d',
    authDomain: 'news-d048d.firebaseapp.com',
    storageBucket: 'news-d048d.appspot.com',
    measurementId: 'G-7MEEGDQTJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ_BP3sIHjuCCIL4xOuC1A6s1BJ5uMnUk',
    appId: '1:157091448589:android:e9963c95625da64ceb5244',
    messagingSenderId: '157091448589',
    projectId: 'news-d048d',
    storageBucket: 'news-d048d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnsqZCSv9rB40Gl_k30L8UIppSAWjOOJc',
    appId: '1:157091448589:ios:ecfcdc228a29016beb5244',
    messagingSenderId: '157091448589',
    projectId: 'news-d048d',
    storageBucket: 'news-d048d.appspot.com',
    iosBundleId: 'com.ashmawi.c3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnsqZCSv9rB40Gl_k30L8UIppSAWjOOJc',
    appId: '1:157091448589:ios:3399d164f8cf3f13eb5244',
    messagingSenderId: '157091448589',
    projectId: 'news-d048d',
    storageBucket: 'news-d048d.appspot.com',
    iosBundleId: 'com.ashmawi.c3.RunnerTests',
  );
}