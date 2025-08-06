// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:masters_/screens/auth-ui/user-panel/main-screen.dart';
// // import 'package:masters_/screens/auth-ui/welcome-screen.dart';
// // import 'package:masters_/utils/app-constant.dart';

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     Timer(Duration(seconds: 3), () {
// //       Get.offAll(() => WelcomeScreen());
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // final size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       backgroundColor: AppConstant.appSecondoryColor,
// //       appBar: AppBar(
// //         backgroundColor: AppConstant.appSecondoryColor,
// //         elevation: 0,
// //       ),
// //       // ignore: avoid_unnecessary_containers
// //       body: Container(
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: Container(
// //                 width: Get.width,
// //                 alignment: Alignment.center,
// //                 child: Lottie.asset(
// //                   "images/cart.json",
// //                   height: 300,
// //                   width: 400,
// //                 ),
// //               ),
// //             ),

// //             // ignore: avoid_unnecessary_containers
// //             Container(
// //               margin: EdgeInsets.only(bottom: 25.0),
// //               width: Get.width,
// //               alignment: Alignment.center,
// //               child: Text(
// //                 AppConstant.appCreatedBy,
// //                 style: TextStyle(
// //                   color: AppConstant.appTextColor,
// //                   fontSize: 12,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/main-screen.dart';
import '../../../Admin-panel/home/screens/admin_home_screen.dart';
import '../../home/screens/user_home_screen.dart';
import '../../models/user-model.dart';
import '../../utils/app-constants.dart';
import 'welcome-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkUser();
    });
  }

  Future<void> checkUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // User not logged in
      Get.offAll(() => WelcomeScreen());
      return;
    }

    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        final isAdmin = data?['isAdmin'] ?? false;

        if (isAdmin == true) {
          Get.offAll(() => AdminHomeScreen());
        } else {
          Get.offAll(() => MainScreen());
        }
      } else {
        // User document not found
        Get.offAll(() => WelcomeScreen());
      }
    } catch (e) {
      print("🔥 Firebase Error: $e");
      Get.offAll(() => MainScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height - AppBar().preferredSize.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      "images/cart.json",
                      height: 300,
                      width: 400,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25.0),
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    AppConstant.appPoweredBy,
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
