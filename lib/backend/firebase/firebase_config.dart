import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBL-I9jbY2REM0Zd1HraeOT1CiVxVc-05c",
            authDomain: "asistente-salud-mental.firebaseapp.com",
            projectId: "asistente-salud-mental",
            storageBucket: "asistente-salud-mental.firebasestorage.app",
            messagingSenderId: "396960097890",
            appId: "1:396960097890:web:533caf3ec732efa91e133b"));
  } else {
    await Firebase.initializeApp();
  }
}
