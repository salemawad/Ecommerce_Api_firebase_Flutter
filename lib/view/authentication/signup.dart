import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/signup.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/view/widget/customboutton.dart';
import 'package:myecommerc/view/widget/customtextfield.dart';

 import '../../function/validatinput.dart';
import '../widget/stackprofile.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpImp controller = Get.put(SignUpImp());
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(top: 70),
        children: [
          const Text(
            "New Account",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
            Center(
              child: StackProfile(
              onPressed: ()  {

                controller.addimage();
              },
              image: Image.asset(
                  ImageTable.user,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
          ),
            ),
          Form(
              key: controller.globalKey,
              child: Column(
                children: [
                  CustomField(
                    valid: (val) {
                      return ValidatInput(val!, 5, 30, "username");
                    },
                    title: "User Name",
                    iconsuff: Icons.man,
                    mycontroller: controller.username,
                  ),
                  CustomField(
                    valid: (val) {
                      return ValidatInput(val!, 5, 30, "email");
                    },
                    onsaved: (val) {
                      val = controller.uemail.text.trim();
                    },
                    title: "Email",
                    iconsuff: Icons.email,
                    mycontroller: controller.uemail,
                  ),
                  CustomField(
                    valid: (val) {
                      return ValidatInput(val!, 5, 30, "password");
                    },
                    onsaved: (val) {
                      val = controller.upassword.text.trim();
                    },
                    title: "Password",
                    iconsuff: Icons.lock,
                    mycontroller: controller.upassword,
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: "Create",
                    color: Colors.blue,
                    onPressed: () async {
                       await controller.signUP();

                    },
                  ),
                ],
              )),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "you have an account",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.goToLogin();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
