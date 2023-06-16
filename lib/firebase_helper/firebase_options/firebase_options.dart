import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:273780875506:android:3597ceeb6bfd1f219e306b',
        apiKey: 'AIzaSyCC1A5Jb9dmjLGZcGRUCgHlVBLE-97TaXo',
        projectId: 'ecommerceapp-3c706',
        messagingSenderId: '273780875506',
      );
    }



  }
}