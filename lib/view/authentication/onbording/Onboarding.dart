import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/onboarding_controller.dart';

import '../../widget/customBottonOnb.dart';
import '../../widget/customdote.dart';
import '../../widget/slider.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingControllerImplement controller = Get.put(OnboardingControllerImplement());

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Expanded(flex: 3, child: CustomSlider()),
      const Expanded(flex: 1, child: Customdote()),
            Expanded(flex: 0, child: CustomButtonOnBoarding(text: "Next", color: Colors.redAccent, onPressed: controller.next))
    ])));
  }
}
