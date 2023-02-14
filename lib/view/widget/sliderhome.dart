import 'package:flutter/material.dart';

import 'custombbutton.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({Key? key, required this.background, required this.header, required this.subTitle, required this.textButton}) : super(key: key);

  final String background;
  final String header;
  final String subTitle;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 240,
      height: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
      child: Stack(
        children: [
          Image.network(background,fit: BoxFit.scaleDown),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    header,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "With code: rikafashion2021",
                    style: TextStyle(
                        fontSize: 11, color: Color(0x66666666)),),
                  ButtonSelect(
                    width: 70,
                    height: 25,
                    textButton:  Text(textButton,style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                    margin: const EdgeInsets.only(top: 10),
                    colorButton: Colors.black,
                    onPressed: () {
                    },
                  ),
                ],
              ))
        ],
      ),
    )
    ;
  }
}
