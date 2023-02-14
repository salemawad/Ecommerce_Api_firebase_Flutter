import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myecommerc/controller/cartController.dart';
import 'package:myecommerc/model/Api/prodcut_model.dart';
import 'package:myecommerc/view/cart.dart';


class MyCategory extends StatelessWidget {
  final ProductModel?  productModel;

  const MyCategory({Key? key,  this.productModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              padding: const EdgeInsets.all(30),
              icon: const Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          },color: Colors.black),
          actions: [
            IconButton(
                padding: const EdgeInsets.all(30),
                icon: const Icon(Icons.shopping_cart),onPressed: (){
              Get.to(const Cart());
            },color: Colors.black),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child:Image.network(productModel!.image, fit: BoxFit.scaleDown),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,),
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 326,
                      height: 110,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              SizedBox(
                                width:200 ,
                                child: Text(
                                  productModel!.title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.w400,
                                    fontSize: 15, ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rate_rounded,color: Colors.amber,),
                                    Text("${productModel!.rating.rate}  ${productModel!.rating.count} Review",
                                        style: const TextStyle(
                                          fontSize: 11,
                                        )),
                                  ],
                                )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xEEEEEEEE)),
                                child: const Text("+ 1 -"),
                                alignment: Alignment.center,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 12.5),
                                child: Text("Avaliable in stok",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 85,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Description",style: TextStyle(fontSize: 16),),
                              Container(
                                  margin: const EdgeInsets.only(top: 12,left: 15,right: 15),
                                  height: 47,
                                  width: double.infinity,
                                  child:  Text(
                                    productModel!.description,
                                    style: const TextStyle(fontSize: 11),
                                  ))
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75,left: 5),
                      child: Row(children: [
                        Column(children: [
                          const Text("Total Price",style: TextStyle(fontSize: 9),),
                          Text("\$${productModel!.price}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                        ],),
                        const Spacer(),
                        StreamBuilder<QuerySnapshot>(
                          stream: controller.chekCart(productModel!.id),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState==ConnectionState.waiting){
                              return  GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  width: 200,
                                  height: 50,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.shopping_cart,color:Colors.white),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Add to cart",
                                        style:  TextStyle(color:Colors.white,fontSize: 16),)

                                    ],
                                  ),
                                ),
                              );
                            }
                            else if(snapshot.hasData&&snapshot.data!.docs.isNotEmpty){
                              return GestureDetector(
                                onTap: () => Get.snackbar(
                                    "Alert",
                                    "The product is already in the cart",
                                  duration: const Duration(seconds: 3),
                                  borderRadius: 30,
                                  backgroundColor: Colors.black38,
                                  colorText: Colors.white,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  width: 200,
                                  height: 50,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:Colors.black,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const[
                                      Icon(Icons.shopping_cart,color:Colors.white),
                                      const SizedBox(width: 5,),
                                      Text(
                                        "Add to cart",
                                        style:  TextStyle(color:Colors.white,fontSize: 16),)

                                    ],
                                  ),
                                ),
                              );

                            }
                            else{
                              return GestureDetector(
                                onTap:()async {
                                  await controller.uploadData(
                                      productModel!.id,
                                      "${productModel!.title}",
                                      "${productModel!.image}",
                                        productModel!.price
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  width: 200,
                                  height: 50,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: controller.isClicke.value? Colors.black38:Colors.black,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.shopping_cart,color:Colors.white),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Add to cart",
                                        style:  TextStyle(color:Colors.white,fontSize: 16),)

                                    ],
                                  ),
                                ),
                              );

                            }
                          },
                        )

                      ],),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
// Container(
// padding: const EdgeInsets.all(15),
// width: double.infinity,
// // height:700,
// decoration: const BoxDecoration(
// color: Color(0xFFF1EFF1),
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(50),
// bottomRight: Radius.circular(50))),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Center(
// child: Stack(
// children: [
// Container(
// margin: EdgeInsets.only(top: 40),
// height: 250,
// width: 250,
// decoration: const BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.all(Radius.circular(150))),
// ),
// Image.network(
// productModel!.image,
// width: 270,
// height: 270,
// ),
// ],
// alignment: Alignment.bottomCenter,
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Text(productModel!.title,style: const TextStyle(fontSize: 18),),
// Padding(
// padding: const EdgeInsets.all(10),
// child: Text(
// "\$${productModel!.price}",
// style: const TextStyle(
// color: Colors.red,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all( 15),
// child: Text(productModel!.description,
// style: const TextStyle(
// color: Colors.black38,
// fontSize: 14,
// )),
// ),
// ]),
// ),
// const SizedBox(
// height: 50,
// ),
// CustomButton(
// text: "Add To Cart",
// color: Colors.amberAccent,
// onPressed: () {
// collectionReference.add({
// 'name':productModel!.title,
// 'image':productModel!.image,
// 'price':productModel!.price,
// "uid":
// FirebaseAuth.instance.currentUser!.uid
// });
// })