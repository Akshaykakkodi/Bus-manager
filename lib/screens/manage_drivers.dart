import 'package:bus_management/constants.dart';
import 'package:bus_management/screens/add_drivers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Manage_drivers extends StatefulWidget {
  var accessToken;

  var apiKey;

   Manage_drivers({Key? key,required this.accessToken,required this.apiKey}) : super(key: key);

  @override
  State<Manage_drivers> createState() => _Manage_driversState();
}

class _Manage_driversState extends State<Manage_drivers> {
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
        title: Text("Driver List"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: FutureBuilder(
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
                                      Map<String, String> headers = {
                                        'Authorization': 'Bearer ${widget.accessToken}'
                                      };
                                      var response= await Api.deleteDriver(headers, widget.apiKey, snapshot.data["driver_list"][index]["id"].toString());
                                      if(response["status"]==true){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"])));
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"])));
                                      }
                                      setState(() {

                                      });
                                    },child: Text("Delete",style: TextStyle(color: Colors.white),),color: Colors.red,),
                                  )
                                ],
                              ),
                            ),
                          ),

                        );
                      }
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Add_drivers(accessToken:widget.accessToken,apiKey:widget.apiKey),));
                      },
                      child: Container(

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text("Add drivers",style: TextStyle(fontSize: 18,color: Colors.white),)),
                      ),
                    ),
                  ),
                )
              ],
            );
          }else{
            return Text("no data");
          }

        }
      ),

    );
  }
}
