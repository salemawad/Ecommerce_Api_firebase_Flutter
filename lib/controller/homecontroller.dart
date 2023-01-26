import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myecommerc/view/myprofile.dart';

class HomeController extends GetxController{

 CollectionReference collectionReference=FirebaseFirestore.instance.collection("cart");

  goToProfile(){
    Get.to(const MyProfile());
  }
}