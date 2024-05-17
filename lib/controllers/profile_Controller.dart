import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/app_response.dart';
import '../pages/homepage/homepage.dart';
import '../repository/profile_repo.dart';

class ProfileController extends GetxController{

  ProfileRepo profileRepo=Get.find<ProfileRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController firstnameTextController=TextEditingController(text:"marloo");
  TextEditingController lastnameTextController=TextEditingController(text:"bb");
  TextEditingController phoneTextController=TextEditingController(text:"111");
  TextEditingController newpasswordTextController=TextEditingController(text:"87654321");
  TextEditingController  newpasswordconfirmation=TextEditingController(text:"87654321");
  TextEditingController  currentpassword=TextEditingController(text:"87654321");
  TextEditingController  address=TextEditingController(text:"321");


  var token = "".obs;

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;
  var avatarImagePath = ''.obs;

  void updateprofile() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      File? imageFile;
      if (avatarImagePath.value.isNotEmpty) {
        imageFile = File(avatarImagePath.value);
      }
      AppResponse response=await profileRepo.updateprofile(photo:  imageFile, firstnameTextController.text,lastnameTextController,
          phoneTextController.text,newpasswordTextController.text,newpasswordconfirmation.text,currentpassword.text,address.text

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
      firstnameTextController.text = response.data!['name'];
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
  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
      // image = File(pickedFile.path);
    }
  }

}