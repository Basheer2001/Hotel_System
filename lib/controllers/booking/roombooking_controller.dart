import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/app_response.dart';
import '../../pages/booking/bookingroom.dart';
import '../../repository/bookingroom_repo.dart';



class BookingRoomController extends GetxController {

  BookingRoomRepo bookingRepo = Get.find<BookingRoomRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController roomIdTextController = TextEditingController(text:"1");
  TextEditingController checkInDateTextController = TextEditingController(text:"2024-6-24");
  TextEditingController checkOutDateTextController = TextEditingController(text:"2024-06-25");
  TextEditingController numAdultsTextController = TextEditingController(text:"2");
  TextEditingController numChildrenTextController = TextEditingController(text:"1");
  TextEditingController paymentMethodTextController = TextEditingController(text:"cash");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;


  void bookRoom() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await bookingRepo.booking(
          roomIdTextController.text,
          checkInDateTextController.text,checkOutDateTextController.text,numAdultsTextController.text,
          numChildrenTextController.text,paymentMethodTextController.text,
      );
      loginLoadingState.value = false;
      if (response.success) {
        Get.to(() => BookingSuccessScreen());
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }
    }}
}