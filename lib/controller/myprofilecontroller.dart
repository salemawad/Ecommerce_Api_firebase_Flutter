import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:myecommerc/coordination/dialog.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  late File file;
  late Reference reference;
   var imageUrl;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");
  var piked;

  addImage(String docId) async {
    // await Permission.photos.request();
    // var permissionStatus = await Permission.photos.status;
    // if (permissionStatus.isGranted) {
    piked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (piked != null) {
       file = File(piked.path);
      var rand = Random().nextInt(10000);
      var imagename = "$rand" + basename(piked.path);
      reference = FirebaseStorage.instance.ref("images").child("$imagename");
       await reference.putFile(file);
      imageUrl = await reference.getDownloadURL();
      print(imageUrl);
      print(docId);
       await collectionReference.doc(docId).update(
           {"image": imageUrl});

    }
  }

  signout()async{
    showLoding();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed("/");

  }
// }
@override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
}
