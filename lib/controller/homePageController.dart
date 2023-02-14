import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/cart.dart';

import '../view/mainpage.dart';
import '../view/myprofile.dart';
import '../view/product.dart';

class HomePController extends GetxController{


  RxInt index =0.obs;
  List<Widget> pages = [
    MainPage(),
    Home(),
    Cart(),
    MyProfile(),
  ];


}