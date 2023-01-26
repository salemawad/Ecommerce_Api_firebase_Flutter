
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
  import 'package:myecommerc/coordination/dialog.dart';
import 'package:path/path.dart';

import '../view/authentication/login.dart';
abstract class SignupController extends GetxController {
  goToLogin();

  signUP();

  addimage();
}

class SignUpImp extends SignupController {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController uemail;
  late TextEditingController upassword;
  late TextEditingController confirmpassword;

  @override
  goToLogin() {
    Get.off(const Login());
  }

  @override
  signUP() async {
    await reference.putFile(file);
    imageUrl = await reference.getDownloadURL();
    print(imageUrl);
    UserCredential credential;
    var formdata = globalKey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoding();
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: uemail.text.trim(), password: upassword.text.trim());
        if (credential != null) {
          await FirebaseFirestore.instance.collection("users").add({
            "username": username.text.trim(),
            "email": uemail.text.trim(),
            "image":imageUrl,
            "uid":FirebaseAuth.instance.currentUser!.uid
          });
          Get.offNamed("/login");
        }
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak password") {
          print('The password weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      // Get.to(Login());
      // Get.delete<SignUpImp>();

      print("Validate");
    } else {
      print("Validate");
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    uemail = TextEditingController();
    upassword = TextEditingController();
    confirmpassword = TextEditingController();
    super.onInit();
  }

  late File file;
  late Reference reference;
  var imageUrl;


  var piked;
  @override
  addimage()async {
    piked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (piked != null) {
      file = File(piked.path);
      var rand = Random().nextInt(10000);
      var imagename = "$rand" + basename(piked.path);
      reference = FirebaseStorage.instance.ref("images").child("$imagename");
    }
  }}
