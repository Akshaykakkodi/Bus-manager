import 'package:bus_management/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Assign_driver extends StatefulWidget {
  var accessToken;

  var apiKey;

  var index;

   Assign_driver({Key? key,required this.accessToken,required this.apiKey,required this.index}) : super(key: key);

  @override
  State<Assign_driver> createState() => _Assign_driverState();
}

class _Assign_driverState extends State<Assign_driver> {
  Future getDetails() async {
    Map<String, String> headers = {
      'Authorization': 'Bearer ${widget.accessToken}'
    };
    var data;
    data =await Api.drivers(headers, widget.apiKey);
    print(data);
    return data;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Assign driver"),
        backgroundColor: Colors.black,
      ),
      body:FutureBuilder(
          future: getDetails(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasData){
              return Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${snapshot.data["driver_list"].length} Drivers found"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data["driver_list"].length,
                        itemBuilder: (context,index) {
                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      color: Colors.blueGrey[50],
                                      child: Image.asset("Assets/images/dr-removebg-preview.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0,right: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data["driver_list"][index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text("License no:${snapshot.data["driver_list"][index]["license_no"]}",style: TextStyle(fontSize: 12),)
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(onPressed: () async {
                                        Bus.constantBusList[widget.index]["driver"]=snapshot.data["driver_list"][index]["name"];
                                        Bus.constantBusList[widget.index]["license"]=snapshot.data["driver_list"][index]["license_no"];
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Assigned")));
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_screen(accessToken: widget.accessToken, apiKey: widget.apiKey),), (route) => false);

                                      },child: Text("Assign",style: TextStyle(color: Colors.white),),color: Colors.red,),
                                    )
                                  ],
                                ),
                              ),
                            ),

                          );
                        }
                    ),
                  ),

                ],
              );
            }else{
              return Text("no data");
            }

          }
      ) ,
    );
  }
}
