import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/myprofilecontroller.dart';
import 'package:myecommerc/coordination/Imageassets.dart';
import 'package:myecommerc/view/widget/listTilemyData.dart';
import 'package:myecommerc/view/widget/stackprofile.dart';
import 'package:myecommerc/view/widget/tabbarprofile.dart';


class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = 0;
    ProfileController controller = Get.put(ProfileController());
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
            backgroundColor: Colors.white,
            actions: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                controller.signout();

              }, icon: const Icon(Icons.logout_outlined,color: Colors.white,)),backgroundColor: Colors.black,),
            )],
            ),
              body:
              StreamBuilder(
                stream: controller.collectionReference
                    .where("uid",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  return
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                   Center(
                     child: StackProfile(
                            onPressed: () {
                              controller.addImage(snapshot.data!.docs[index].id);
                            },
                            image: snapshot.hasData && snapshot.connectionState ==ConnectionState.active? Image.network(
                                   "${snapshot.data!.docs.first['image']}",
                              fit: BoxFit.fill,
                              width: 80,
                              height: 80,
                            ):Image.asset(
                              ImageAssets.user,
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            )
                          ),
                   ),

                    TabBarProfile(),
                  Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.8,
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
                              const SizedBox(
                                child: Center(child: Text("No Request")),
                              //   child: ListView.builder(
                              //     itemCount: CategoryList.length,
                              //     itemBuilder: (context, index) {
                              //       return Container(
                              //         padding: const EdgeInsets.all(8),
                              //         margin: const EdgeInsets.all(8),
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius: BorderRadius.circular(8)),
                              //         child: ListTile(
                              //           leading: Icon(Icons.cancel),
                              //           subtitle: const Text("My Ecommerce"),
                              //           trailing: Image.asset(
                              //               "${CategoryList[index].image}"),
                              //           title: Text("${CategoryList[index].name}",
                              //               style: const TextStyle(fontSize: 18)),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              ),
                            ],
                          ),
                  )

                  ])
                  );
                }),
              ),
        ));
  }
}
