import 'dart:convert';

import 'package:get/get.dart';
import 'package:myecommerc/view/myprofile.dart';
import 'package:http/http.dart'as http;
import '../model/Api/prodcut_model.dart';

class HomeController extends GetxController{

 // CollectionReference collectionReference=FirebaseFirestore.instance.collection("cart");

  goToProfile(){
    Get.to(const MyProfile());
  }

 Future<List<ProductModel>> getProduct() async {
   Uri url=Uri.parse("https://fakestoreapi.com/products");
   var response =await http.get(url);
   if(response.statusCode==200){
     List responseBody=jsonDecode(response.body);
     // var jsonArray=responseBody['list']as List;
     // print(responseBody);
     return responseBody.map((job) => new ProductModel.fromJson(job)).toList();
       // jsonArray.map((jsonObject) => ProductModel.fromJson(jsonObject)).toList();
   }else {
     return[];
   }


 }
  Future<List<ProductModel>> getProductJe() async {
    Uri url=Uri.parse("https://fakestoreapi.com/products/category/jewelery");
    var response =await http.get(url);
    if(response.statusCode==200){
      List responseBody=jsonDecode(response.body);
      // var jsonArray=responseBody['list']as List;
      // print(responseBody);
      return responseBody.map((job) => new ProductModel.fromJson(job)).toList();
      // jsonArray.map((jsonObject) => ProductModel.fromJson(jsonObject)).toList();
    }else {
      return[];
    }

  }
  Future<List<ProductModel>> getProductEl() async {
    Uri url=Uri.parse("https://fakestoreapi.com/products/category/electronics");
    var response =await http.get(url);
    if(response.statusCode==200){
      List responseBody=jsonDecode(response.body);
      // var jsonArray=responseBody['list']as List;
      // print(responseBody);
      return responseBody.map((job) => new ProductModel.fromJson(job)).toList();
      // jsonArray.map((jsonObject) => ProductModel.fromJson(jsonObject)).toList();
    }else {
      return[];
    }

  }
  Future<List<ProductModel>> getProductMe() async {
    Uri url=Uri.parse("https://fakestoreapi.com/products/category/men's clothing");
    var response =await http.get(url);
    if(response.statusCode==200){
      List responseBody=jsonDecode(response.body);
      // var jsonArray=responseBody['list']as List;
      // print(responseBody);
      return responseBody.map((job) => new ProductModel.fromJson(job)).toList();
      // jsonArray.map((jsonObject) => ProductModel.fromJson(jsonObject)).toList();
    }else {
      return[];
    }

  }
  Future<List<ProductModel>> getProductWo() async {
    Uri url=Uri.parse("https://fakestoreapi.com/products/category/women's clothing");
    var response =await http.get(url);
    if(response.statusCode==200){
      List responseBody=jsonDecode(response.body);
      // var jsonArray=responseBody['list']as List;
      // print(responseBody);
      return responseBody.map((job) => new ProductModel.fromJson(job)).toList();
      // jsonArray.map((jsonObject) => ProductModel.fromJson(jsonObject)).toList();
    }else {
      return[];
    }

  }

  @override
  void onInit() {
    getProduct();
    getProductJe();
    super.onInit();
  }


}