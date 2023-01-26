import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/middelwaer/myservices.dart';

class MyMiddlewaere extends GetMiddleware{

  late MyServices myServices=Get.find() ;
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("watched")=="1"){
      return const RouteSettings(name:'/login');
    }

  }


}