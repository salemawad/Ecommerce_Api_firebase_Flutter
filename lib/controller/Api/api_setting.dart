import 'dart:convert';

import 'package:http/http.dart'as http;
class ApiSetting{

  static const String baseUrl="https://fakestoreapi.com/";
  static const String productUrl='$baseUrl+products';
  static const String categoriesUrl='$baseUrl+categories';


    static Future<dynamic> getCategories() async {
    var responseBody;
    Uri url=Uri.parse(categoriesUrl);
    var response =await http.get(url);
    if(response.statusCode==200){
      return responseBody=jsonDecode(response.body);
    }else {
      return Error();
    }

  }

}