import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/homepage/homepage.dart';
import '../repository/account_repo.dart';
import '../models/app_response.dart';

class loginController extends GetxController{


  //LoginRepo accountRepo= Get.find<LoginRepo>();
  AccountRepo accountRepo=Get.find<AccountRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"basheeralkhiat86@gmail.com");
  TextEditingController PasswordTextController=TextEditingController(text:"12345678");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;


  void login() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await  accountRepo.login(usernameTextController.text, PasswordTextController.text);
      loginLoadingState.value=false;
      if(response.success){
        Get.to(() => HotelHome());
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }else{
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );

      }
    }
  }



}