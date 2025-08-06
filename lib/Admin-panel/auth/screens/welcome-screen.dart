import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../User-panel/utils/app-constants.dart';
import '../controllers/google-sign -in-controller.dart';
import 'sign-in-screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final MyGoogleSignInController _googleSignInController = Get.put(
    MyGoogleSignInController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Welcome",
          style: TextStyle(
            color: AppConstant.appTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset(
                "images/cart.json",
                height: 250,
                width: 500,
                alignment: Alignment.center,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                "Tap For Shopping",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: Get.height / 12),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset(
                    "images/Google.webp",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),

                  label: Text(
                    "Sign in with Google",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _googleSignInController.signinWithGoogle();
                  },
                ),
              ),
            ),
            SizedBox(height: Get.height / 24),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton.icon(
                  icon: Image.asset(
                    "images/email.webp",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),

                  label: GestureDetector(
                    onTap: () => Get.offAll(() => SignInScreen()),
                    child: Text(
                      "Sign in with Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 27),
              child: GestureDetector(
                onTap: () => Get.offAll(() => SignInScreen()),
                child: Text(
                  "Already have an account/ SignIn ",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
