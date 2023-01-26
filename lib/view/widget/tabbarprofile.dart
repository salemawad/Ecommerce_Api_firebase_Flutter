import 'package:flutter/material.dart';

class TabBarProfile extends StatelessWidget {
  const TabBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xEFEFEFEF)),
      child: const TabBar(
        labelColor: Colors.blueAccent,
        unselectedLabelColor: Color(0xcdcdcdcd),
        padding: EdgeInsets.only(right: 20),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        tabs: [
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
