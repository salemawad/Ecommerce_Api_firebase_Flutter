import 'package:flutter/material.dart';
import 'package:myecommerc/coordination/colors.dart';

class TabBarProfile extends StatelessWidget {
  const TabBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xEFEFEFEF)),
      child:   TabBar(
        labelColor: Colors.white,
        unselectedLabelColor:  Colors.black,
        padding: const EdgeInsets.only(right: 20),
        indicator: BoxDecoration(border: Border.all(color: MyColors.primary,width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: MyColors.primary,
        ),
        tabs: const [
          Tab(
            text: "My Data",
          ),
          Tab(
            text: "My requests ",
          ),
        ],
      ),
    );
  }
}
