import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../repository/account_repo.dart';
import '../models/app_response.dart';

class loginController extends GetxController{


  //LoginRepo accountRepo= Get.find<LoginRepo>();
  AccountRepo accountRepo=Get.find<AccountRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController usernameTextController=TextEditingController(text:"rrr@gmail.com");
  TextEditingController PasswordTextController=TextEditingController(text:"12341234");

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;



  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'token');
  }



  void login() async{
    firstSubmit.value=true;
    if(formKey.currentState!.validate()){
      loginLoadingState.value=true;
      AppResponse response=await  accountRepo.login(usernameTextController.text, PasswordTextController.text);
      loginLoadingState.value=false;
      if(response.success){
        Get.to(() => ());
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


  void logout() async {
    await clearToken();
    // Additional logout logic...
  }

}