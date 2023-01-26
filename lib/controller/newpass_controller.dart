import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/authentication/login.dart';

abstract class NewPassController extends GetxController{
goToSuccess();

}
class NewPassCImp extends NewPassController{
  late TextEditingController pass;
  late TextEditingController confpass;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  @override
  void onInit() {
    pass = TextEditingController();
    confpass = TextEditingController();


  }

  @override
  goToSuccess() {
    var formdata = globalKey.currentState;
    if (formdata!.validate()) {
      Get.to(Login());
    } else {
      print("Validate");
    }   }
  }
