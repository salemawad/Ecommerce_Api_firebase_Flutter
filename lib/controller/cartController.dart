import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/categoryItem.dart';

class CartController extends GetxController{

  CollectionReference collectionReference=FirebaseFirestore.instance.collection("cart");
}