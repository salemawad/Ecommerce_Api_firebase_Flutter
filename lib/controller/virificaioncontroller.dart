import 'package:get/get.dart';

import '../view/authentication/newpass.dart';

abstract class VerificationCodeController extends GetxController{
  goToNew();
}
class VerificationCImp extends VerificationCodeController{
  @override
  goToNew() {

    Get.to(NewPassord());
  }
}