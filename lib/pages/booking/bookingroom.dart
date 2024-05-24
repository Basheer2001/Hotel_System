import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/booking/roombooking_controller.dart';
import '../homepage/homepage.dart';

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
           /* Positioned.fill(
              child: Image.asset(
                "assets/images/images.jpg",
                fit: BoxFit.cover,
              ),
            ),*/
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50,),
                    Text(
                      "Book Room",
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white38.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,

                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
focusedBorder:  OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
  borderSide: BorderSide(color: Colors.grey, width: 2.0),

)),
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
                            color: Colors.white38.withOpacity(0.5), // Set shadow color
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),

                            )
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
                            color: Colors.white38.withOpacity(0.5), // Set shadow color
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                            borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                          ),
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),

                            )
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
                                  color: Colors.white38.withOpacity(0.5), // Set shadow color
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
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                                  borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                                  borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                                ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                  )
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
                    // Other form fields...
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: MediaQuery.of(context).size.height * 0.5,
                                child: TableCalendar(
                                  firstDay: DateTime.utc(2020, 1, 1),
                                  lastDay: DateTime.utc(2100, 12, 31),
                                  focusedDay: controller.selectedDate.value,
                                  selectedDayPredicate: (day) {
                                    return isSameDay(controller.selectedDate.value, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    controller.selectedDate.value = selectedDay;
                                    Get.back(); // Close the dialog when a date is selected
                                  },
                                  calendarBuilders: CalendarBuilders(
                                    defaultBuilder: (context, day, focusedDay) {
                                      // Customize the day cells as needed
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Select Date',style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.submitReservation();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text('Submit Reservation',style: TextStyle(color: Colors.black),),
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
