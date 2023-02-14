import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/onboarding_controller.dart';

import '../../../coordination/colors.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                  children: [
      const Expanded(flex: 3, child: CustomSlider()),
        Padding(
          padding: const EdgeInsets.only(bottom: 40,left: 20,right: 20),
          child: Row(
          children: [
              Customdote(),
              Spacer(),
              CustomButtonOnBoarding(color: MyColors.primary, onPressed: controller.next)
          ],
      ),
        ),
              // Expanded(flex: 0, child: )
    ]),
            )));
  }
}
