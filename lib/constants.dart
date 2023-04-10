import 'dart:convert';

import 'package:http/http.dart';

class Api{
 // static var apiKey;

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
  
  static Future<dynamic> drivers(Map<String, String> headers,String apiKey) async {
    var response= await  get(Uri.parse("http://flutter.noviindus.co.in/api/DriverApi/$apiKey/"),headers: headers);
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      return data;
    }
  }

 static Future<dynamic> deleteDriver(Map<String, String> headers,String apiKey,var id) async {
    var response=await delete(Uri.parse("http://flutter.noviindus.co.in/api/DriverApi/$apiKey/"),headers: headers,body: {
      "driver_id":id
    });
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      return data;
    }
  }

 static Future<dynamic> addDriver(Map<String, String> headers,String apiKey,name,mobile,license_no) async {
    var response= await post(Uri.parse("http://flutter.noviindus.co.in/api/DriverApi/$apiKey/"),headers: headers,body: {
      "name":name,
      "mobile":mobile,
      "license_no":license_no
    });
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      return data;
    }
  }

 static Future<dynamic> busList(Map<String, String> headers,String apiKey) async {
    var response=await get(Uri.parse("http://flutter.noviindus.co.in/api/BusListApi/$apiKey/"),headers: headers);
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      return data;
    }
  }
  
  
}
class Bus{
 static List constantBusList=[
    {
      "bus_id": "1",
      "bus_name": "KSRTC",
      "bus_type":"Swift scania P-series",
      "seat": "1*3",
      "driver":"asasa",
      "license":"saa"
    },
    {
      "bus_id": "2",
      "bus_name": "KSRTC",
      "bus_type":"Swift scania P-series",
      "seat": "1*3",
      "driver":"arjuu",
      "license":"e141"

    },
    {
      "bus_id": "3",
      "bus_name": "KSRTC",
      "bus_type":"Super fast",
      "seat": "2*2",
      "driver":"jhon",
      "license":"678904"
    },
    {
      "bus_id": "4",
      "bus_name": "KSRTC",
      "bus_type":"Low floor",
      "seat": "2*2",
      "driver":"Akshay",
      "license":"78657"
    },

  ];
}