

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/services/services_controller.dart';
import '../profile/profile.dart';
import '../rooms/roomscreen.dart';
import '../services/mybookingservice.dart';
import '../services/servicespage.dart';

class SideNavigationScreen extends StatelessWidget {

  final ServicesController servicesController = Get.find<ServicesController>();

  @override
  Widget build(BuildContext context) {
    int bookingId = 1;
    return  Scaffold(
        backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Navigation Screen', style: TextStyle(color: Colors.blue,
          shadows: [
            Shadow(
              offset: Offset(5.0, 5.0), // Shadow position
              blurRadius: 1.0, // Shadow blur
              color: Colors.grey, // Shadow color
            ),
          ],

        )),
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
        body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              SizedBox(height: 140,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RoomScreen());
                    },
                    child: Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white, // Set card background color
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFF2B74FE), // Set the border color
                              width: 2, // Set the border width
                            ),
                            left: BorderSide(
                              color: Color(0xFF2B74FE), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.hotel,size: 65,),
                            Text("Rooms",
                              style: TextStyle(color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 1.0,
                                    color: Colors.black26.withOpacity(0.5), // Smooth shadow
                                  ),
                                ],
                              ),)

                          ],
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 30,),
                  GestureDetector(
                    onTap: () async{
                      await servicesController.fetchServices();
                      Get.to(() => ServicesPage(services: servicesController.services));
                    },
                    child: Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white, // Set card background color
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFF2B74FE), // Set the border color
                              width: 2, // Set the border width
                            ),
                            left: BorderSide(
                              color: Color(0xFF2B74FE), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.room_service,size: 65,),
                            Text("Services",
                              style: TextStyle(color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 1.0,
                                    color:  Colors.black26.withOpacity(0.5), // Smooth shadow
                                  ),
                                ],
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
                Center(
                  child: SpinKitCircle(
                    color: Colors.blueAccent,
                    size: 100.0,
                  ),
                ),
                Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
      GestureDetector(
        onTap: () {
       //   Get.to(() => Report());
        },
        child: Card(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white, // Set card background color
              borderRadius: BorderRadius.circular(8),
              border: Border(
                top: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
                left: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(Icons.report,size: 65,),
                Text("Reports",
                  style: TextStyle(color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 1.0,
                        color:  Colors.black26.withOpacity(0.5), // Smooth shadow
                      ),
                    ],
                  ),)
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: ()async {
          await servicesController.fetchBookingServices(bookingId);
          print(servicesController.services);
          Get.to(() => MyBookingService(services: servicesController.services));
        },
        child: Card(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white, // Set card background color
              borderRadius: BorderRadius.circular(8),
              border: Border(
                top: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
                left: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(Icons.book,size: 60,),
                Text("Book service",
                  style: TextStyle(color: Colors.black,

                    shadows: [
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 1.0,
                        color: Colors.black26.withOpacity(0.5), // Smooth shadow
                      ),
                    ],
                  ),)
              ],
            ),
          ),
        ),
      ),
    ]),




              ],
            ),
          ),);
  }
}