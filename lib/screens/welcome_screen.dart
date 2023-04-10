import 'package:flutter/material.dart';

import 'login_screen.dart';

class Welcome_screen extends StatefulWidget {
  const Welcome_screen({Key? key}) : super(key: key);

  @override
  State<Welcome_screen> createState() => _Welcome_screenState();
}

class _Welcome_screenState extends State<Welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
        
          children: [
            Expanded(
              child: SizedBox(
                child: Center(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0,bottom: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_drop_down,size: 40,color:Colors.yellow,),
                        ),
                      )

                    ]
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 30,left: 35,right: 35),
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login_screen(),), (route) => false);
                  },
                  child: Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                    height: 60,
                    width: double.infinity,
                    child: Center(child: Text("Get Started",style: TextStyle(fontSize: 18,color: Colors.red),)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),


    );
  }
}
