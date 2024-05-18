import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RoomBookingController extends GetxController{

  late final RxString name;
  late final RxString email;
  late final RxString phoneNumber;
  late final RxInt numberOfGuests;
  late final Rx<DateTime> checkInDate;
  late final Rx<DateTime> checkOutDate;

  get formKey => null;

  @override
  void onInit() {
    super.onInit();
    name = ''.obs;
    email = ''.obs;
    phoneNumber = ''.obs;
    numberOfGuests = 1.obs;
    checkInDate = DateTime.now().obs;
    checkOutDate = DateTime.now().add(Duration(days: 1)).obs;
  }

  Future<void> selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkInDate.value) {
      checkInDate.value = picked;
    }
  }

  Future<void> selectCheckOutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate.value,
      firstDate: checkInDate.value.add(Duration(days: 1)),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkOutDate.value) {
      checkOutDate.value = picked;
    }
  }

  void submitReservation() {
    // Here you can handle the logic for submitting the reservation
    print('Submitting reservation...');
    print('Name: ${name.value}');
    print('Email: ${email.value}');
    print('Phone Number: ${phoneNumber.value}');
    print('Number of Guests: ${numberOfGuests.value}');
    print('Check-in Date: ${checkInDate.value}');
    print('Check-out Date: ${checkOutDate.value}');
  }


}