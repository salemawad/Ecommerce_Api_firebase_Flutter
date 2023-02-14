import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myecommerc/view/widget/customcontainerList.dart';
import 'package:myecommerc/view/widget/sliderhome.dart';
import 'package:shimmer/shimmer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor:const Color(0xEFEFEFEF),

        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const Text(
              "Our Fashion App",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20,
              ),
            ),
            Row(children: [
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                width: 260,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xF3F4F5F6),
                    borderRadius: BorderRadius.circular(30)),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.search, color: Colors.black,)),
                // color: const Color(0xF3F4F5F6),
              ),
              const SizedBox(width: 30,),
              const CircleAvatar(backgroundColor: Colors.black,
                child: Icon(Icons.filter_alt_outlined),)
            ],),
            SizedBox(
              width: double.infinity,
              height: 170,
              child: FutureBuilder <QuerySnapshot>(
                future: FirebaseFirestore.instance.collection("slider").get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int i) {
                        return SliderHome(
                          background: "${snapshot.data!.docs[i]['image']}",
                          header: "${snapshot.data!.docs[i]['title']}",
                          subTitle: "${snapshot.data!.docs[i]['subtitle']}",
                          textButton: "${snapshot.data!.docs[i]['button']}",
                        );
                      },
                    );
                  }
                  else {
                    return SizedBox(
                      width: double.infinity,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[500]!,
                        child: Row(
                          children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 240,
                            height: 160,
                            color: Colors.white,
                          ),
                           Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 240,
                            height: 160,
                            color: Colors.white,
                          )
                        ],),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, right: 5),
              child: Row(children: const[
                Text("New Arrivals",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                InkWell(
                    child: Text("View All", style: TextStyle(fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),)),

              ]),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 260,
                child: FutureBuilder <QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection("new arrivals")
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState==ConnectionState.waiting) {
                      return SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[500]!,
                          child: Row(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 155,
                            height: 260,
                              color: Colors.white,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 155,
                              height: 260,
                              color: Colors.white,
                            )
                          ],),
                        ),
                      );                     }
                    else {
                        return  ListView.builder(
                          padding: const EdgeInsets.all(5),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int i) {
                            return CustomProduct(
                              image: "${snapshot.data!.docs[i]['image']}",
                              title: "${snapshot.data!.docs[i]['title']}",
                              subtitle: "${snapshot.data!.docs[i]['subtitle']}",
                              price: "${snapshot.data!.docs[i]['price']}",
                              onTap: () {

                              },);
                          },
                        );
                      }

                  },)
            ),
            const SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.only(top: 7, right: 5),
              child: Row(children: const[
                Text("Popular",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text("View All", style: TextStyle(fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),),

              ]),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 289,
                child: FutureBuilder <QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection("popular").get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int i) {
                          return CustomProduct(
                            image: "${snapshot.data!.docs[i]['image']}",
                            title: "${snapshot.data!.docs[i]['title']}",
                            subtitle: "${snapshot.data!.docs[i]['subtitle']}",
                            price: "${snapshot.data!.docs[i]['price']}",
                            onTap: () {

                            },);
                        },
                      );
                    }
                    else {
                      return SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[500]!,
                          child: Row(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 155,
                              height: 260,
                              color: Colors.white,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 155,
                              height: 260,
                              color: Colors.white,
                            )
                          ],),
                        ),
                      );
                    }
                  },)
            ),
          ],)

      ),
    );
  }
}
