import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/categoryItem.dart';

CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("cart");

uploadData(int i, List<CategoryModel> list) async {
  await collectionReference.add({
    "name": list[i].name,
    "image": list[i].image,
    "price": list[i].price,
    "uid": FirebaseAuth.instance.currentUser!.uid
  });
}
