import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping/User-panel/auth/controllers/get-device-controller.dart';
import '../../../main-screen.dart';
import '../../home/screens/user_home_screen.dart';
import '../../models/user-model.dart';

class MyGoogleSignInController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signinWithGoogle() async {
    final GetDeviceController getDeviceController = Get.put(
      GetDeviceController(),
    );
    try {
      // ignore: unused_local_variable
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please Wait..");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );
        final User? user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            userDeviceToken: getDeviceController.deviceToken.toString(),
            country: '',
            userAddress: '',
            street: '',
            city: '',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
          );
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          EasyLoading.dismiss();
          Get.offAll(() => MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      // ignore: avoid_print
      print("Error $e");
    }
  }
}
