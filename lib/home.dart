import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/widget/BottonNav.dart';

import 'controller/homePageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePController controller=Get.put(HomePController());

    return Obx(() => Scaffold(
      bottomNavigationBar:AllBottomNav(
        onTap:(i) {
          controller.index.value=i;
        },
        current:controller.index.value ,
      ),
      body: IndexedStack(index: controller.index.value,
        children:controller.pages,) ,
    ));
  }
}
