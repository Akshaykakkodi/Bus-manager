import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 150,
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
                    padding: EdgeInsets.only(left: 95.0,bottom: 40),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.circle,color:Colors.yellow,),
                    ),
                  )

                ]
            ),
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
              Padding(
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
              
            ],
          ),
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("21 buses found"),
              )
            ],
          ),
          Expanded(
            child: SizedBox(
              child:
              ListView.builder(
                itemCount: 8,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                    child: Card(
                      child: Row(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("KSRTC",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("Swift Scania P-series")
                              ],
                            ),
                          ),

                          MaterialButton(onPressed: () {

                          },child: Text("Manage",style: TextStyle(color: Colors.white),),color: Colors.red,)
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
