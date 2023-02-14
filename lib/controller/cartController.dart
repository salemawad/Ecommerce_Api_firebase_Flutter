import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("cart");


  RxBool isClicke = false.obs;
  var current = FirebaseAuth.instance.currentUser!.uid;


  // late String DocID;
  uploadData(
      int id,
      String title,
    String image,
    double price,
  ) async {
    Get.snackbar(
      "Success",
      "The product has been added to the cart",
      duration: const Duration(seconds: 3),
      borderRadius: 30,
      backgroundColor: Colors.black38,
      colorText: Colors.white,
    );
    await collectionReference.add({
      "id":id,
      'name': title,
      'image': image,
      'price': price,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "count": 1,
    });
    DocID=collectionReference.doc().id;
  }
  var DocID;
  Stream<QuerySnapshot> chekCart(int id)async*{

     yield* collectionReference.where("uid",isEqualTo: current).where("id",isEqualTo: id).snapshots();


  }

  dialog(path) {
    Get.defaultDialog(
        title: "Are you sure",
        onConfirm: () {
          collectionReference.doc(path).delete();
          Get.back();
        },
        onCancel: () {});
  }

  int count = 1;


  plus(String docId, int counter,double price) {
    DocID=docId;
    count = counter;
    count++;
    collectionReference.doc(docId).update({"count": count,
    "price":price*count
    });
    update();
  }

  remove(String docId, counter,double price) {
    count = counter;
    count > 1 ? count-- : collectionReference.doc(docId).delete();
    collectionReference.doc(docId).update({"count": count,
      "price":price/counter
    });
  }
@override
  void onInit() {
  super.onInit();
  }
//
// RxInt count=1.obs;
//  counterPlus(){
//    count++;
//    update();
//
//  }
//  counterRemove(){
//    count!=1? count--:null;
//    update();
//  }
}
