import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';


class CustomButtonOnBoarding extends GetView<OnboardingController> {
  final String text;

  final Color color;
  final void Function()? onPressed;

  const CustomButtonOnBoarding({Key? key, required this.text, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
      color: color,
      height: 45,
      minWidth: 200,
    );
  }
}
