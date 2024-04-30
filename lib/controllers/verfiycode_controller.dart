
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../pages/auth/Register/register1.dart';
import '../repository/checkemail_repo.dart';
import '../repository/verfiycode_repo.dart';

class VerfiyCodeController extends GetxController{

  VerfiyCodeRepo  verfyCodeRepo=Get.find<VerfiyCodeRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController numberTextController=TextEditingController(text:"713276");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;

  void verfiycode() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      AppResponse response = await verfyCodeRepo.verfiycode(
          numberTextController.text);
      loginLoadingState.value = false;
      if (response.success) {
        print("Verification Code Response: ${response.data}");
        Get.to(() => Register1());
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
    }}}


