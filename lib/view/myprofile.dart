import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/myprofilecontroller.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/view/widget/listTilemyData.dart';
import 'package:myecommerc/view/widget/stackprofile.dart';
import 'package:myecommerc/view/widget/tabbarprofile.dart';

import '../data/category.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = 0;
    ProfileController controller = Get.put(ProfileController());
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
            ),
            body:
            FutureBuilder(
              future: controller.collectionReference
                  .where("uid",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                return
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                 StackProfile(
                        onPressed: () {
                          controller.addImage();
                        },
                        image: snapshot.hasData && snapshot.connectionState ==ConnectionState.done? Image.network(
                               "${snapshot.data!.docs.first['image']}",
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ):Image.asset(
                          ImageTable.user,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        )
                      ),

                  TabBarProfile(),
                Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.6,
                        color: Color(0xEFEFEFEF),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children:  [
                                ListTileMyData(
                                  icon: Icons.person,
                                  name: snapshot.hasData?"${snapshot.data!.docs.first['username']}":"name",
                                  title: "Name",
                                ),
                                ListTileMyData(
                                  icon: Icons.email,
                                  name: snapshot.hasData?"${snapshot.data!.docs.first['email']}":"example@gmail.com",
                                  title: "Email",
                                ),
                               const ListTileMyData(
                                  icon: Icons.lock,
                                  name: "**********",
                                  title: "Password",
                                ),
                              ],
                            ),
                            ListView.builder(
                              itemCount: CategoryList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ListTile(
                                    leading: Icon(Icons.cancel),
                                    subtitle: const Text("My Ecommerce"),
                                    trailing: Image.asset(
                                        "${CategoryList[index].image}"),
                                    title: Text("${CategoryList[index].name}",
                                        style: const TextStyle(fontSize: 18)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                )

                ])
                );
              }),
            ));
  }
}
