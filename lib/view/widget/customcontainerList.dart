import 'package:flutter/material.dart';


class CustomProduct extends StatelessWidget {
  const CustomProduct({Key? key, required this.image, required this.title, required this.subtitle, required this.price, required this.onTap}) : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(7),
          width: 155,
          height: 244.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),

          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 150,
                      height: 155,
                      child: Image.network(image)),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: IconButton(onPressed: (){},
                        icon: const Icon(Icons.favorite_border,color: Colors.white),),),
                  )
                ],
              ),
              const SizedBox(height: 7),
              Text(title,style: const TextStyle(fontSize: 14),maxLines: 1,),
              Text(subtitle,style: const TextStyle(overflow:TextOverflow.ellipsis ,fontSize: 11,color: Colors.black38),),
              const SizedBox(height: 5),
              Text("\$${price}",style: const TextStyle(fontSize: 14),),

            ],
          )
      ),
    );
  }
}
