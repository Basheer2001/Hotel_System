import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/roombooking_controller.dart';


class RoomBooking extends GetView<RoomBookingController> {
  const RoomBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final RoomBookingController controller = Get.put(RoomBookingController());


    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/images.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50,),
                    Text("Book Room",style: TextStyle(fontSize: 20,fontStyle:FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add border
                        borderRadius: BorderRadius.circular(8), // Add border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Set shadow color
                            spreadRadius: 2, // Set spread radius
                            blurRadius: 3, // Set blur radius
                            offset: Offset(0, 2), // Set offset
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, // Example: Setting the font weight to bold
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: customColor), // Set the border color when focused
                            borderRadius: BorderRadius.circular(8), // Set border radius
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.name.value = value!;
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add border
                        borderRadius: BorderRadius.circular(8), // Add border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Set shadow color
                            spreadRadius: 2, // Set spread radius
                            blurRadius: 3, // Set blur radius
                            offset: Offset(0, 2), // Set offset
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, // Example: Setting the font weight to bold
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: customColor), // Set the border color when focused
                            borderRadius: BorderRadius.circular(8), // Set border radius
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          // You can add more email validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          controller.email.value = value!;
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add border
                        borderRadius: BorderRadius.circular(8), // Add border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Set shadow color
                            spreadRadius: 2, // Set spread radius
                            blurRadius: 3, // Set blur radius
                            offset: Offset(0, 2), // Set offset
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, // Example: Setting the font weight to bold
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: customColor), // Set the border color when focused
                            borderRadius: BorderRadius.circular(8), // Set border radius
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          // You can add more phone number validation logic here if needed
                          return null;
                        },
                        onSaved: (value) {
                          controller.phoneNumber.value = value!;
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey), // Add border
                              borderRadius: BorderRadius.circular(8), // Add border radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // Set shadow color
                                  spreadRadius: 2, // Set spread radius
                                  blurRadius: 3, // Set blur radius
                                  offset: Offset(0, 2), // Set offset
                                ),
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Number of Guests',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, // Example: Setting the font weight to bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: customColor), // Set the border color when focused
                                  borderRadius: BorderRadius.circular(8), // Set border radius
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              initialValue: '1',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of guests';
                                }
                                // You can add more validation logic here if needed
                                return null;
                              },
                              onSaved: (value) {
                                controller.numberOfGuests.value = int.parse(value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check-in Date: ${controller.checkInDate.toString().substring(0, 10)}',
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        ElevatedButton(
                          onPressed: () => controller.selectCheckInDate(context),
                          child: Text('Select Date'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Set the border radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check-out Date: ${controller.checkOutDate.toString().substring(0, 10)}',
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        ElevatedButton(
                          onPressed: () => controller.selectCheckOutDate(context),
                          child: Text('Select Date'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Set the border radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          // Here, you can handle submitting the reservation data, such as sending it to a backend server
                          // You can also navigate to a confirmation page or show a dialog confirming the reservation
                          controller.submitReservation();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Set the border radius
                          ),
                        ),
                      ),
                      child: Text('Submit Reservation',),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
