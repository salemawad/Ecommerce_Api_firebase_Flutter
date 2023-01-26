import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/cart.dart';
 import 'package:myecommerc/view/widget/customboutton.dart';

import '../model/categoryItem.dart';

class MyCategory extends StatelessWidget {
  final CategoryModel categoryModel;

  const MyCategory({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference=FirebaseFirestore.instance.collection("cart");

    return Scaffold(
        backgroundColor: Color(0xFF035AA6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF1EFF1),
          leading: IconButton(
              padding: EdgeInsets.all(30),
              icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          },color: Colors.black),
          actions: [
            IconButton(
                padding: EdgeInsets.all(30),
                icon: Icon(Icons.shopping_cart),onPressed: (){
              Get.to(Cart());
            },color: Colors.black),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                // height:700,
                decoration: const BoxDecoration(
                    color: Color(0xFFF1EFF1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 250,
                          width: 250,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(150))),
                        ),
                        Image.asset(
                          "${categoryModel.image}",
                          width: 270,
                          height: 270,
                        ),
                      ],
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("${categoryModel.name}",style: const TextStyle(fontSize: 18),),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "\$${categoryModel.price}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 15),
                    child: Text("${categoryModel.description}",
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        )),
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: "Add To Cart",
                  color: Colors.amberAccent,
                  onPressed: () {
                    collectionReference.add({
                      'name':categoryModel.name,
                      'image':categoryModel.image,
                      'price':categoryModel.price,
                      "uid":
                      FirebaseAuth.instance.currentUser!.uid
                    });
                  })
            ],
          ),
        ));
  }
}
