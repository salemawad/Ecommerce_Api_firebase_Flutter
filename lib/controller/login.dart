import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../coordination/dialog.dart';
import '../view/authentication/forgetpass.dart';
import '../view/authentication/signup.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToforget();
}

class LoginCImp extends LoginController {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpass = true;

  showPassword() {
    isshowpass = isshowpass == true ? false : true;

    update();
  }

  showiconpass() {
    isshowpass == false ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
    update();
  }

  @override
  goToSignUp() {
    Get.off(const SignUp());
  }

  @override
  login() async {
    var formdata = globalKey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoding();
        UserCredential credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim());

        if (credential != null) {
          Get.offNamed("/home");
        }
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("user-not-found");
        } else if (e.code == 'wrong-password') {
          print("wrong-password");
        }
      }
      print("  valid");
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToforget() {
    Get.off(ForgetPassord());
  }
}
