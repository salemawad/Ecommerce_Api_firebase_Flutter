import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/cartController.dart';

class Cart extends StatelessWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          iconTheme: const IconThemeData.fallback(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: StreamBuilder<QuerySnapshot>(
            stream: controller.collectionReference
                .where("uid", isEqualTo: controller.current)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    double total = snapshot.data!.docs[index]["price"];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: 375,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 15,
                            )
                          ],
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              "${snapshot.data!.docs[index]["image"]}",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 9),
                            width: 102,
                            height: 82,
                            child: Column(
                              children: [
                                Text(
                                  "${snapshot.data!.docs[index]["name"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text("\$${total.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xeeeeeeee)),
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {
                                    controller.plus(
                                        snapshot.data!.docs[index].id,
                                        snapshot.data!.docs[index]["count"],
                                        snapshot.data!.docs[index]["price"]);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 25,
                                  )),
                              Text("${snapshot.data!.docs[index]['count']}"),
                              IconButton(
                                  onPressed: () {
                                    controller.remove(
                                        snapshot.data!.docs[index].id,
                                        snapshot.data!.docs[index]["count"],
                                        snapshot.data!.docs[index]["price"]);
                                  },
                                  icon: const Icon(Icons.remove, size: 25)),
                            ]),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No product in the cart"),
                );
              }
            },
          ),
        ));
  }
}
