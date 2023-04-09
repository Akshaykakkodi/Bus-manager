import 'package:flutter/material.dart';

class Manage_bus_2 extends StatefulWidget {
  const Manage_bus_2({Key? key}) : super(key: key);

  @override
  State<Manage_bus_2> createState() => _Manage_bus_2State();
}

class _Manage_bus_2State extends State<Manage_bus_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("KSRTC Swift Scania P-series ",style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children:   [
                      Padding(
                        padding: EdgeInsets.only(top: 35.0,left: 40),
                        child: Text("Rohit Sharma",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.0,top: 10),
                        child: Text("License no: pj15546jh1",style: TextStyle(color:Colors.white,),
                        ),
                      ),

                    ],

                  ),
                  Image.asset("Assets/images/dr-removebg-preview.png",height: 120,width: 110,)
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,top: 15,bottom: 15),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0,top: 10),
                          child: Icon(Icons.event_seat,size: 30,),
                        )
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: const [
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                              Icon(Icons.event_seat,size: 30,color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),




                  ],
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}

