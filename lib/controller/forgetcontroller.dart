import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/authentication/verifycode.dart';


abstract class ForgetPassController extends GetxController {
  goTonewPass() ;
}

class ForgetPassCImp extends ForgetPassController {
  late TextEditingController email;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email = TextEditingController();
  }

  @override
  goTonewPass() {
    var formdata = globalKey.currentState;
    if (formdata!.validate()) {
      Get.to(VerificationCode());
    } else {
      print("Validate");
    }   }

}
