import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shopping/Admin-panel/auth/screens/splash-screen.dart'
    hide SplashScreen;
import 'package:shopping/User-panel/auth/screens/all-catagories-screen.dart';
import 'package:shopping/User-panel/home/screens/user_home_screen.dart';
import 'package:shopping/main-screen.dart';

// import 'firebase_options.dart';
// ignore: unused_import

import 'firebase_options.dart';
// ignore: unused_import
import 'User-panel/auth/screens/splash-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Shoppings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 105, 221, 209),
        ),
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
