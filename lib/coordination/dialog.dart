import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myecommerc/coordination/colors.dart';

showLoding() {
  return Get.defaultDialog(title: "loading",
     content: LoadingAnimationWidget.staggeredDotsWave(color: MyColors.blue, size: 50),


  );
}
