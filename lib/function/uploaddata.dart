
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myecommerc/model/Api/prodcut_model.dart';

CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("cart");

 uploadData(int i, List<ProductModel> list) async {
  await collectionReference.add({
    "id": list[i].id,
    "name": list[i].title,
    "image": list[i].image,
    "price": list[i].price,
    "category":list[i].category,
    "description":list[i].description,
    "uid": FirebaseAuth.instance.currentUser!.uid
  });
}
