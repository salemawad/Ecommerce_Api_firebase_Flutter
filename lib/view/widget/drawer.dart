import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../coordination/Imageassets.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("users");
      return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: FutureBuilder(
                future: collectionReference.where("uid",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid).get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                                child: snapshot.hasData && snapshot
                                    .connectionState == ConnectionState.done
                                    ? Image.network(
                                  "${snapshot.data!.docs.first['image']}",
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70
                                )
                                    : Image.asset(
                                  ImageTable.user,
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70
                                )
                            ),
                          ),
                        ),
                        Text("${snapshot.data!.docs.first["username"]}")
                      ],
                    );
                  } else {
                    return    Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child:ClipOval(
                          child: Image.asset(
                          ImageTable.user,
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70
                      ))),
                    );
                  }
                })),
         ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
           onTap: (){
            Get.offNamed("/home");
           },
        ),
        ListTile(
          title: Text("Profile"),
          leading: Icon(Icons.person),
           onTap: (){
            Get.toNamed("/profile");
           },
        ),
        ListTile(
          title: Text("Setting"),
          leading: Icon(Icons.settings),
           onTap: (){},
        ),
      ],
    );
  }
}










