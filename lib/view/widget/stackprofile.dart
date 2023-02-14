import 'package:flutter/material.dart';


class StackProfile extends StatelessWidget {
    StackProfile({Key? key, required this.image,required this.onPressed}) : super(key: key);
  Image image;
    void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(100)),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: image
            ),
          ),
        ),
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blueAccent),
            child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                )))
      ],
    );
  }
}
