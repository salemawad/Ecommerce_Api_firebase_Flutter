import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/onboarding_controller.dart';

import '../../data/onbardData.dart';

class CustomSlider extends GetView<OnboardingControllerImplement> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
       controller:controller.pageController,
       onPageChanged: (val){
        controller.Onchangedonbording(val);
      },
      itemCount: Onboardinglist.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Image.asset(Onboardinglist[i].image!),
            const SizedBox(
              height: 10,
            ),
            const Text("ــــــــــــــــــــــــــــــــــ"),
            const SizedBox(
              height: 20,
            ),
            Text(Onboardinglist[i].titel!),
            Text(Onboardinglist[i].descryption!),
          ],
        );
      },
    );
  }
}
