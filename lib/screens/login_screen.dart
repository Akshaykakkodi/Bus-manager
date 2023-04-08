import 'package:bus_management/constants.dart';
import 'package:bus_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  int count=0;
  var ob;
 var fkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: ListView(
          children: [
            Container(
               color: Colors.red,
              height: 260,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Welcome",style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,bottom: 50),
                    child: Text("Manage your Bus and Drivers",style:TextStyle(fontSize: 18,color: Colors.white)),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25,bottom: 15),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "username required";
                        }
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText:"Enter Username" ,filled: true,fillColor: Colors.blueGrey[50],border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 10,bottom: 25),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "password required";
                        }
                      },
                      textAlign: TextAlign.center,
                      obscureText: ob,
                      decoration: InputDecoration(hintText: "Enter Password",
                          suffixIcon: InkWell(
                          onTap:() {
                            count++;
                            count%2==0?ob=false:ob=true;
                            setState(() {

                            });
                          },
                              child: Icon(Icons.remove_red_eye,color:Colors.grey,)),
                          filled: true,fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 160,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () async {
                        if(fkey.currentState!.validate()){
                          EasyLoading.show( status: "Loading");
                          var logData= await Api.loginApi(username.text,password.text);
                          print(logData["status"]);
                          if(logData["status"]==true){

                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_screen(),), (route) => false);
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(logData["message"])));
                          }else if(logData["status"]==false){
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(logData["message"])));
                          }
                        }
                      },
                      child: Container(

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text("Get Started",style: TextStyle(fontSize: 18,color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
