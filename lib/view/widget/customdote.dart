import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/onboarding_controller.dart';

import '../../data/onbardData.dart';


class Customdote extends StatelessWidget {
  const Customdote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImplement>(
        builder: ((controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  Onboardinglist.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 5),
                        duration: const Duration(milliseconds: 900),
                        width: controller.current == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                      ))
            ])));
  }
}
