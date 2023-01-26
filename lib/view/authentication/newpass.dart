import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/newpass_controller.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/coordination/colors.dart';
import 'package:myecommerc/view/widget/customboutton.dart';
import 'package:myecommerc/view/widget/customtextfield.dart';

import '../../function/validatinput.dart';


class NewPassord extends StatelessWidget {
  const NewPassord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewPassCImp controller = Get.put(NewPassCImp());
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Image.asset(
              ImageAssets.newpass,
              alignment: Alignment.center,
              height: 200,
              width: 200,
            ),
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
            "Please enter a new password ",
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
                  title: "Password",
                  mycontroller: controller.pass,valid: (val) {
                  return ValidatInput(val!, 5, 30, "password");
                },
                ),
                CustomField(
                  iconsuff: Icons.email,
                  title: "Confirm Password",
                  mycontroller: controller.confpass,valid: (val) {
                  return ValidatInput(val!, 5, 30, "password");
                },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(text: "Next", color: MyColors.primary, onPressed: (){controller.goToSuccess();})
              ],
            ),
          ),

        ],
      ),
    ));
  }
}
