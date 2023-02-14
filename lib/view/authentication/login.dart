import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/login.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/coordination/colors.dart';
import 'package:myecommerc/function/validatinput.dart';
import 'package:myecommerc/view/widget/customInkwell.dart';
import 'package:myecommerc/view/widget/customboutton.dart';
import 'package:myecommerc/view/widget/customtextfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCImp controller = Get.put(LoginCImp());
    return Scaffold(
         body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          Image.asset(
            ImageAssets.loginPhoto,
            alignment: Alignment.center,
            height: 200,
            width: 200,
          ),
          const Text("Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.black)),
          const Text(
            "Log in your account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: MyColors.secondary),
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
                GetBuilder<LoginCImp>(
                  builder: (controller) => CustomField(
                    icon: controller.isshowpass == false
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    obscuertext: controller.isshowpass,
                    onTapICon: () => controller.showPassword(),
                    valid: (val) {
                      return ValidatInput(val!, 5, 30, "password");
                    },
                    iconsuff: Icons.lock,
                    title: "Password",
                    mycontroller: controller.password,
                  ),
                ),
                Container(
                  child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Text(
                          "Forget Password ?",
                          style: TextStyle(fontSize: 12
                          ,color: MyColors.primary),
                        ),
                      ),
                      onTap: () {
                        controller.goToforget();
                      }),
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 3, bottom: 25),
                ),
                CustomButton (
                  text: "Login",
                  color: MyColors.blue,
                  onPressed: ()async {
                   await controller.login();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Or login with",
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomInkwell(text: "Facebook", color: Colors.blue),
              SizedBox(width: 15,),
              CustomInkwell(text: "Google", color: MyColors.primary),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create a new account",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.goToSignUp();
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: MyColors.primary),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
