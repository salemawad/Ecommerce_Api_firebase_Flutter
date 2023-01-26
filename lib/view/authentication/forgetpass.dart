import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/coordination/colors.dart';

import '../../controller/forgetcontroller.dart';
import '../../function/validatinput.dart';
import '../widget/customboutton.dart';
import '../widget/customtextfield.dart';

class ForgetPassord extends StatelessWidget {
  const ForgetPassord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPassCImp controller = Get.put(ForgetPassCImp());
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 50),
          Image.asset(
            ImageAssets.forgetpass,
            alignment: Alignment.center,
            height: 200,
            width: 200,
          ),
          const Text("Forget Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Please enter your registered email ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black38),
          ),
          const Text(
            "We will send the authentication code to the email you will provide ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black38),
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
            key: controller.globalKey,
            child: Column(
              children: [
                CustomField(
                  iconsuff: Icons.email,
                  title: "Email",
                  mycontroller: controller.email,
                  valid: (val) {
                    return ValidatInput(val!, 5, 30, "email");
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  text: "Next",
                  color: MyColors.primary,
                  onPressed: () {
                    controller.goTonewPass();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
