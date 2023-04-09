import 'package:bus_management/constants.dart';
import 'package:flutter/material.dart';

class Add_drivers extends StatefulWidget {
  var accessToken;

  var apiKey;

   Add_drivers({Key? key,required this.accessToken,required this.apiKey}) : super(key: key);

  @override
  State<Add_drivers> createState() => _Add_driversState();
}

class _Add_driversState extends State<Add_drivers> {
  TextEditingController name=TextEditingController();
  TextEditingController license= TextEditingController();
  TextEditingController mobile= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Driver"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25,bottom: 15),
                  child: TextFormField(
                    controller: name,

                    validator: (value) {
                      if(value!.isEmpty){
                        return "name required";
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText:"Enter Name" ,filled: true,fillColor: Colors.blueGrey[50],border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25,bottom: 15),
                  child: TextFormField(
                    controller: license,

                    validator: (value) {
                      if(value!.isEmpty){
                        return "License no: required";
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText:"Enter License Number" ,filled: true,fillColor: Colors.blueGrey[50],border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25,bottom: 15),
                  child: TextFormField(
                    controller: mobile,

                    validator: (value) {
                      if(value!.isEmpty){
                        return "mobile no: required";
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText:"Enter Mobile Number" ,filled: true,fillColor: Colors.blueGrey[50],border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),

          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () async {
                Map<String, String> headers = {
                  'Authorization': 'Bearer ${widget.accessToken}'
                };
               var response= await Api.addDriver(headers, widget.apiKey, name.text, mobile.text, license.text);
               if(response["status"]==true){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"])));
               }else{
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"])));
               }
               name.clear();
               mobile.clear();
               license.clear();
              },
              child: Container(

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
                height: 60,
                width: double.infinity,
                child: Center(child: Text("Save",style: TextStyle(fontSize: 18,color: Colors.white),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
