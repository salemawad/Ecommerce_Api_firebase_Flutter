import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/cartController.dart';
import 'package:myecommerc/coordination/colors.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My Cart",style: TextStyle(color: Colors.black,fontSize: 20,),)),
          iconTheme: const IconThemeData.fallback(),
          elevation: 0,
          backgroundColor:MyColors.backgroundAppBar,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: controller.collectionReference
                .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: ListTile(
                        trailing: IconButton(onPressed:(){
                          Get.defaultDialog(title: "Are you sure",onConfirm:()=>controller.collectionReference.doc().delete(),
                          onCancel: (){} );
                        } ,icon: const Icon(Icons.cancel_outlined),),
                        title: Text(
                          "${snapshot.data!.docs[index]["name"]}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        subtitle: Text("\$ ${snapshot.data!.docs[index]["price"]}"),
                        leading: Image.asset(
                            "${snapshot.data!.docs[index]["image"]}",
                          width: 70,
                          height: 70,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child:CircularProgressIndicator()
              ,
                );
              }
            }
    ),
        ));
  }
}
