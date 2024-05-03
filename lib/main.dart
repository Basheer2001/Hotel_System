import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/auth/register/checkemail.dart';
import 'package:untitled1/providers/api_provider.dart';
import 'package:untitled1/repository/account_repo.dart';
import 'package:untitled1/repository/checkemail_repo.dart';
import 'package:untitled1/repository/register_repo.dart';
import 'package:untitled1/repository/resetpassword_repo.dart';
import 'package:untitled1/repository/verfiycode_repo.dart';

import 'controllers/register1_controller.dart';
import 'controllers/verfiycode_controller.dart';

//controller
/////

///////////////////////////////////////////
class AppBinding extends Bindings{
  @override
  void dependencies() {
    // Get.put(APIProvider());
    Get.lazyPut(() => APIProvider());
    Get.lazyPut(() => AccountRepo());
    Get.lazyPut(() => RegisterRepo());
    Get.lazyPut(() => CheckEmailRepo());
    Get.lazyPut(() => VerfiyCodeRepo());
    Get.lazyPut(() => ResetPasswordRepo());
    // Get.lazyPut(()=>VerfiyCodeController());
    // Get.lazyPut(()=>Register1Controller());
    Get.put(VerfiyCodeController());
    Get.put(Register1Controller());
  }

}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Checkemail (),
    );
  }
}


