import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({Key? key, required this.text, required this.color}) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 45,
      alignment: Alignment.center,
      color: color ,
      child: InkWell(
        child: Text(text,style:const TextStyle(color: Colors.white) ,),
        onTap: () {},
      ),
    );
  }
}
