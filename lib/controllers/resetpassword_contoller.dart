import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../pages/auth/login.dart';
import '../repository/resetpassword_repo.dart';

class ResetPasswordController extends GetxController{


  //LoginRepo accountRepo= Get.find<LoginRepo>();
  ResetPasswordRepo resetpasswordRepo=Get.find<ResetPasswordRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"rrr@gmail.com");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;



  void resetpassword() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await resetpasswordRepo.resetpassword(
          usernameTextController.text);
      loginLoadingState.value = false;
      if (response.success) {
        Get.to(() => Login());
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
    }
  }}