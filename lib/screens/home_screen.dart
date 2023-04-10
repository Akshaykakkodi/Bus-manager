import 'package:bus_management/constants.dart';
import 'package:bus_management/screens/manage_bus.dart';
import 'package:bus_management/screens/manage_drivers.dart';
import 'package:flutter/material.dart';

import 'manage_bus_2.dart';

class Home_screen extends StatefulWidget {
  var accessToken;

  var apiKey;

   Home_screen({Key? key,required this.accessToken,required this.apiKey}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
 Future getData() async {
    Map<String, String> headers = {
      'Authorization': 'Bearer ${widget.accessToken}'
    };
    var data= await Api.busList(headers, widget.apiKey);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){

            snapshot.data["bus_list"]=Bus.constantBusList;

            return Column(
              children: [
                Container(
                  color: Colors.black,
                  height: 100,
                  child: Stack(
                      alignment: Alignment.center,
                      children:[
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'moov',
                                style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'be',
                                style: TextStyle(color: Colors.yellow,fontSize: 35,fontWeight:FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 90.0,bottom: 30),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_drop_down,size: 40,color:Colors.yellow,),
                          ),
                        )

                      ]
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                          children:[
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.red),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.0,left: 12),
                                    child: Text("Bus",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text("Manage your bus",style: TextStyle(color:Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child:Image.asset('Assets/images/bus-removebg-preview.png',scale:4,),
                              ),
                            )
                          ]
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Manage_drivers(accessToken:widget.accessToken,apiKey:widget.apiKey),));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                            children:[Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.black),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.0,left: 12),
                                    child: Text("Driver",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text("Manage your driver",style: TextStyle(color:Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0,left: 20),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child:Image.asset('Assets/images/dr-removebg-preview.png',scale:4,),
                                ),
                              )
                            ]
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${snapshot.data["bus_list"].length} buses found"),
                    )
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    child:
                    ListView.builder(
                        itemCount: snapshot.data["bus_list"].length,
                        itemBuilder: (context,index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    color: Colors.blueGrey[50],
                                    child: Image.asset("Assets/images/bus2-removebg-preview.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0,right: 5),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(child: Text(snapshot.data["bus_list"][index]["bus_name"],style: TextStyle(fontWeight: FontWeight.bold),)),
                                        Text(snapshot.data["bus_list"][index]["bus_type"])
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: MaterialButton(onPressed: () {
                                      snapshot.data["bus_list"][index]["seat"]=="1*3"?
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Manage_bus_2(accessToken:widget.accessToken,apiKey:widget.apiKey,bus_list:snapshot.data["bus_list"][index],index:index),)):Navigator.push(context, MaterialPageRoute(builder: (context) => Manage_bus(accessToken:widget.accessToken,apiKey:widget.apiKey,bus_list:snapshot.data["bus_list"][index],index:index),));
                                    },child: Text("Manage",style: TextStyle(color: Colors.white),),color: Colors.red,),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                )
              ],
            );
          }else{
            return Center(child: Text("no data"));
          }

        }
      ),
    );
  }
}
