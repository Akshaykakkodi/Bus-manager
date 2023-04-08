import 'dart:convert';

import 'package:http/http.dart';

class Api{
  static Future<dynamic> loginApi(String username,password)async{
    var response=await post(Uri.parse("http://flutter.noviindus.co.in/api/LoginApi"),body: {
      "username":username,
      "password":password

    });
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
        return data;
    }else{
      return "failed";
    }
  }
}