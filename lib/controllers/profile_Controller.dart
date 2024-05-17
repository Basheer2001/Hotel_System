import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../pages/homepage/homepage.dart';
import '../repository/profile_repo.dart';

class ProfileController extends GetxController{

  ProfileRepo profileRepo=Get.find<ProfileRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController emailTextController=TextEditingController(text:"ramibeyrouthy7@gmail.com");
  TextEditingController nameTextController=TextEditingController(text:"marloo");
  TextEditingController phoneTextController=TextEditingController(text:"111");
  TextEditingController newpasswordTextController=TextEditingController(text:"87654321");
  TextEditingController  newpasswordconfirmation=TextEditingController(text:"87654321");
  TextEditingController  currentpassword=TextEditingController(text:"87654321");
  TextEditingController eemailTextController=TextEditingController(text:"ramibeyrouthy7@gmail.com");


  var token = "".obs;

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;


  void updateprofile() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await profileRepo.updateprofile( nameTextController.text,
          phoneTextController.text,newpasswordTextController.text,newpasswordconfirmation.text,currentpassword.text,

      );
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


  void getProfile() async {
    AppResponse<Map<String, dynamic>> response =
    await profileRepo.getProfile(token.value);
    if (response.success) {
      emailTextController.text = response.data!['email'];
      nameTextController.text = response.data!['name'];
      phoneTextController.text = response.data!['phone'];    } else {
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


      Get.snackbar(
          'Error',
          response.errorMessage!,
          snackPosition: SnackPosition.BOTTOM,);
    }
  }

}