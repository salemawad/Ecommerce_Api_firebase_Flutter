import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/authentication/forgetpass.dart';
import 'package:myecommerc/view/authentication/login.dart';
import 'package:myecommerc/view/authentication/newpass.dart';
import 'package:myecommerc/view/authentication/onbording/Onboarding.dart';
import 'package:myecommerc/view/authentication/signup.dart';
import 'package:myecommerc/view/myprofile.dart';
import 'package:myecommerc/view/test.dart';
import 'middelwaer/middelwear.dart';
import 'middelwaer/myservices.dart';

 bool? isLogin ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   var user= FirebaseAuth.instance.currentUser;
   if(user!=null) {
     isLogin = true;
   }else {
     isLogin = false;
   }
  MyServices myServices=Get.put(MyServices());
  await myServices.initialiservice();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages:[
        GetPage(name: '/', page:()=> const Onboarding(),middlewares: [MyMiddlewaere()]),
        GetPage(name: '/login', page:()=>  isLogin==true? const Home() : const Login(),),
        GetPage(name: '/home', page:()=> Home(),),
         GetPage(name: '/sign up', page:()=> const SignUp()),
        GetPage(name: '/forget', page:()=> const ForgetPassord()),
        GetPage(name: '/new pass', page:()=> const NewPassord()),
        GetPage(name: '/profile', page:()=> const MyProfile()),
      ],
    );
  }
}
