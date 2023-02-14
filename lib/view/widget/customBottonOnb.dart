import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnboardingController> {

  final Color color;
  final void Function()? onPressed;

  const CustomButtonOnBoarding(
      {Key? key,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        child: const Center(child: Icon(Icons.navigate_next,color: Colors.white,size: 35,)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
      ),
    );

    // MaterialButton(
    //   onPressed: onPressed,
    //   child: Text(text, style: const TextStyle(color: Colors.white)),
    //   color: color,
    //   height: 45,
    //   minWidth: 200,
    // );
  }
}
