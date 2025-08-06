// // ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart'
//     show KeyboardVisibilityBuilder;
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../utils/app-constants.dart';
// import 'sign-up-screen.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   get isKeyboardVisible => null;

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(
//       builder: (context, isKeyboardVisible) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppConstant.appScendoryColor,
//             title: Text(
//               "SIGN IN",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             centerTitle: true,
//           ),
//           body: Container(
//             child: Column(
//               children: [
//                 isKeyboardVisible
//                     ? SizedBox.shrink()
//                     : Column(
//                         children: [
//                           LottieBuilder.asset(
//                             "images/cart.json",
//                             height: 200,
//                             width: 500,
//                             alignment: Alignment.center,
//                           ),
//                         ],
//                       ),
//                 Container(margin: EdgeInsets.symmetric(horizontal: 40.0)),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextFormField(
//                     cursorColor: AppConstant.appScendoryColor,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       hintText: "Email",
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Container(margin: EdgeInsets.symmetric(horizontal: 2.0)),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextFormField(
//                     cursorColor: AppConstant.appScendoryColor,
//                     keyboardType: TextInputType.visiblePassword,
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       prefixIcon: Icon(Icons.password),
//                       suffixIcon: Icon(Icons.visibility_off),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Text(
//                     "Forgot Password?",
//                     style: TextStyle(
//                       color: AppConstant.appScendoryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   alignment: Alignment.centerRight,
//                 ),
//                 SizedBox(height: Get.height / 24),
//                 Material(
//                   child: Container(
//                     width: Get.width / 2,
//                     height: Get.height / 15,
//                     decoration: BoxDecoration(
//                       color: AppConstant.appScendoryColor,
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     // ignore: duplicate_ignore
//                     // ignore: sort_child_properties_last
//                     child: Text(
//                       "SIGN IN",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "DON'T HAVE AN ACCOUNT?",
//                       style: TextStyle(color: AppConstant.appScendoryColor),
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () => Get.offAll(() => SignupScreen()),
//                   child: Text(
//                     "Sign up",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import '../utils/app-constants.dart';
// import 'forget-password-screen.dart';
// import 'sign-up-screen.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _obscurePassword = true;

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) return 'Email is required';
//     if (!RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$').hasMatch(value)) {
//       return 'Enter valid lowercase email';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) return 'Password is required';
//     if (value.length < 6) return 'Minimum 6 characters required';
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(
//       builder: (context, isKeyboardVisible) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppConstant.appScendoryColor,
//             title: const Text(
//               "SIGN IN",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             centerTitle: true,
//           ),

//           body: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   if (!isKeyboardVisible)
//                     LottieBuilder.asset(
//                       "images/cart.json",
//                       height: 200,
//                       width: 500,
//                       alignment: Alignment.center,
//                     ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: _emailController,
//                       cursorColor: AppConstant.appScendoryColor,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         prefixIcon: const Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       validator: _validateEmail,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: _passwordController,
//                       obscureText: _obscurePassword,
//                       cursorColor: AppConstant.appScendoryColor,
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         prefixIcon: const Icon(Icons.password),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       validator: _validatePassword,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => Get.offAll(() => const ForgetPasswordScreen()),
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "Forgot Password?",
//                         style: TextStyle(
//                           color: AppConstant.appScendoryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: Get.height / 24),
//                   GestureDetector(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         Get.snackbar(
//                           "Success",
//                           "Sign in valid",
//                           snackPosition: SnackPosition.BOTTOM,
//                         );
//                       }
//                     },
//                     child: Container(
//                       width: Get.width / 2,
//                       height: Get.height / 15,
//                       decoration: BoxDecoration(
//                         color: AppConstant.appScendoryColor,
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         "SIGN IN",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "DON'T HAVE AN ACCOUNT?",
//                         style: TextStyle(color: AppConstant.appScendoryColor),
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () => Get.offAll(() => const SignUpScreen()),
//                     child: const Text(
//                       "Sign up",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, unnecessary_null_comparison, file_names
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shopping/screens/auth-ui/user-panel/main-screen.dart';
// import '../controllers/get-data-user-controller.dart';
// import '../controllers/sign -in-controller.dart';
// import '../utils/app-constants.dart';
// import 'admin-panel/admin-main-screen.dart';
// import 'forget-password-screen.dart';
// import 'sign-up-screen.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final SignInController signInController = Get.put(SignInController());
//   final GetUserDataController getUserDataController = Get.put(
//     GetUserDataController(),
//   );
//   TextEditingController userEmail = TextEditingController();
//   TextEditingController userPassword = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(
//       builder: (context, isKeyboardVisible) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppConstant.appScendoryColor,
//             centerTitle: true,
//             title: Text(
//               "Sign In",
//               style: TextStyle(color: AppConstant.appTextColor),
//             ),
//           ),
//           body: Container(
//             child: Column(
//               children: [
//                 isKeyboardVisible
//                     ? Text("Welcome to my app")
//                     : Column(
//                         children: [
//                           Lottie.asset(
//                             'images/cart.json',
//                             height: 200,
//                             width: 500,
//                           ),
//                         ],
//                       ),
//                 SizedBox(height: Get.height / 20),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       controller: userEmail,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email is required';
//                         }
//                         if (!RegExp(
//                           r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$',
//                         ).hasMatch(value)) {
//                           return 'Enter valid lowercase email';
//                         }
//                         return null;
//                       },
//                       cursorColor: AppConstant.appScendoryColor,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         prefixIcon: Icon(Icons.email),
//                         contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Obx(
//                       () => TextFormField(
//                         controller: userPassword,
//                         obscureText: signInController.isPasswordVisible.value,
//                         cursorColor: AppConstant.appScendoryColor,
//                         keyboardType: TextInputType.visiblePassword,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Password is required';
//                           }
//                           if (value.length < 6) {
//                             return 'Minimum 6 characters required';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           prefixIcon: Icon(Icons.password),
//                           suffixIcon: GestureDetector(
//                             onTap: () {
//                               signInController.isPasswordVisible.toggle();
//                             },
//                             child: signInController.isPasswordVisible.value
//                                 ? Icon(Icons.visibility_off)
//                                 : Icon(Icons.visibility),
//                           ),
//                           contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10.0),
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => ForgetPasswordScreen());
//                     },
//                     child: Text(
//                       "Forget Password?",
//                       style: TextStyle(
//                         color: AppConstant.appScendoryColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: Get.height / 20),
//                 Material(
//                   child: Container(
//                     width: Get.width / 2,
//                     height: Get.height / 18,
//                     decoration: BoxDecoration(
//                       color: AppConstant.appScendoryColor,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: TextButton(
//                       child: Text(
//                         "SIGN IN",
//                         style: TextStyle(color: AppConstant.appTextColor),
//                       ),
//                       onPressed: () async {
//                         String email = userEmail.text.trim();
//                         String password = userPassword.text.trim();

//                         if (email.isEmpty || password.isEmpty) {
//                           Get.snackbar(
//                             "Error",
//                             "Please enter all details",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appScendoryColor,
//                             colorText: AppConstant.appTextColor,
//                           );
//                           return;
//                         }

//                         try {
//                           UserCredential userCredential = await FirebaseAuth
//                               .instance
//                               .signInWithEmailAndPassword(
//                                 email: email,
//                                 password: password,
//                               );

//                           if (!userCredential.user!.emailVerified) {
//                             Get.snackbar(
//                               "Error",
//                               "Please verify your email before login",
//                               snackPosition: SnackPosition.BOTTOM,
//                               backgroundColor: AppConstant.appScendoryColor,
//                               colorText: AppConstant.appTextColor,
//                             );
//                             return;
//                           }

//                           // ✅ Login Success
//                           Get.snackbar(
//                             "Success",
//                             "Login Successfully!",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appScendoryColor,
//                             colorText: AppConstant.appTextColor,
//                           );

//                           Get.offAll(
//                             () => MainScreen(),
//                           ); // Navigate to MainScreen
//                         } on FirebaseAuthException catch (e) {
//                           Get.snackbar(
//                             "Error",
//                             e.message ?? "Something went wrong",
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: AppConstant.appScendoryColor,
//                             colorText: AppConstant.appTextColor,
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: Get.height / 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(color: AppConstant.appScendoryColor),
//                     ),
//                     GestureDetector(
//                       onTap: () => Get.offAll(() => SignUpScreen()),
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: AppConstant.appScendoryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/Admin-panel/home/screens/admin_home_screen.dart';
// ignore: unused_import

// ignore: unused_import
import '../../../User-panel/auth/controllers/get-data-user-controller.dart';
import '../../../User-panel/auth/controllers/sign -in-controller.dart'
    show SignInController;
import '../../../User-panel/auth/screens/forget-password-screen.dart';
import '../../../User-panel/utils/app-constants.dart';
import '../controllers/get-data-admin-controller.dart';
import 'sign-up-screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetAdminDataController getAdminDataController = Get.put(
    GetAdminDataController(),
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appScendoryColor,
            centerTitle: true,
            title: Text(
              "Sign In",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (!isKeyboardVisible)
                    Lottie.asset('images/cart.json', height: 200, width: 500),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: userEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                          r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$',
                        ).hasMatch(value)) {
                          return 'Enter valid lowercase email';
                        }
                        return null;
                      },
                      cursorColor: AppConstant.appScendoryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        obscureText: signInController.isPasswordVisible.value,
                        cursorColor: AppConstant.appScendoryColor,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Minimum 6 characters required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: AppConstant.appScendoryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    child: Container(
                      width: Get.width / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppConstant.appScendoryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: AppConstant.appTextColor),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String email = userEmail.text.trim();
                            String password = userPassword.text.trim();
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );

                              if (!userCredential.user!.emailVerified) {
                                Get.snackbar(
                                  "Error",
                                  "Please verify your email before login",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appScendoryColor,
                                  colorText: AppConstant.appTextColor,
                                );
                                return;
                              }

                              Get.snackbar(
                                "Success",
                                "Login Successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );

                              Get.offAll(() => AdminHomeScreen());
                            } on FirebaseAuthException catch (e) {
                              Get.snackbar(
                                "Error",
                                e.message ?? "Something went wrong",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: AppConstant.appScendoryColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.offAll(() => SignUpScreen()),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppConstant.appScendoryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
