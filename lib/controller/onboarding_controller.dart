import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
 import 'package:myecommerc/middelwaer/myservices.dart';
import '../data/onbardData.dart';

abstract class OnboardingController extends GetxController {
  Onchangedonbording(int i);

  next();
}

class OnboardingControllerImplement extends OnboardingController {
  late PageController pageController;
  int current = 0;
  late MyServices myServices = Get.find();

  @override
  next() {
    current++;

    if (pageController.hasClients) {
      if (current > Onboardinglist.length - 1) {
        myServices.sharedPreferences.setString("watched", "1");
        Get.offNamed("/login");
      } else {
        pageController.animateToPage(current,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut);
      }
    }
  }

  @override
  Onchangedonbording(int i) {
    current = i;
    update();
  }

  //check internet
  // var res;
  //
  // check() async {
  //   res = await checkInternet();
  //   print(res);
  // }

  @override
  void onInit() {
    pageController = PageController();
    // check();
    super.onInit();
  }
}
