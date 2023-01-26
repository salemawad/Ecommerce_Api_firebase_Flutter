import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/virificaioncontroller.dart';
import 'package:myecommerc/coordination/Imageassets.dart';




class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerificationCImp controller = Get.put(VerificationCImp());
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                ImageAssets.verify,
                alignment: Alignment.center,
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Verification Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text("We have sent a verification code to the email you provided",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  )),
              const SizedBox(
                height: 40,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToNew();
                }, // end onSubmit
              ),

            ],
          ),
        ));
  }
}
