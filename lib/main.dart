import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Services.dart';
import 'package:untitled1/controllers/report_controller.dart';
import 'package:untitled1/providers/api_provider.dart';
import 'package:untitled1/repository/account_repo.dart';
import 'package:untitled1/repository/bookingroom_repo.dart';
import 'package:untitled1/repository/checkemail_repo.dart';

import 'package:untitled1/repository/homepage_repo.dart';
import 'package:untitled1/repository/profile_repo.dart';
import 'package:untitled1/repository/register_repo.dart';
import 'package:untitled1/repository/report_repo.dart';
import 'package:untitled1/repository/resetpasswordcode_repo.dart';
import 'package:untitled1/repository/room_repo.dart';
import 'package:untitled1/repository/sendresetpassword_repo.dart';
import 'package:untitled1/repository/verfiycode_repo.dart';
import 'package:untitled1/routes.dart';
import 'controllers/homepage/homepage_controller.dart';
import 'controllers/register1_controller.dart';
import 'controllers/resetpasswordcode_controller.dart';
import 'controllers/roomsearch_controller.dart';
import 'controllers/services/services_controller.dart';
import 'controllers/verfiycode_controller.dart';
import 'core/localaization/changeLocal.dart';
import 'core/localaization/translation.dart';
import 'repository/review_repo.dart';
import 'repository/roomsearch_repo.dart';
import 'repository/services_repo.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // Get.put(APIProvider());
    Get.lazyPut(() => APIProvider());
    Get.lazyPut(() => AccountRepo());
    Get.lazyPut(() => RegisterRepo());
    Get.lazyPut(() => CheckEmailRepo());
    Get.lazyPut(() => VerfiyCodeRepo());
    Get.lazyPut(() => SendResetPasswordRepo());
    Get.lazyPut(() => ResetPasswordCodeRepo());
    Get.lazyPut(()=> HomePageRepo());
    Get.lazyPut(()=> ProfileRepo());
    Get.lazyPut(()=>ReportRepo());
    Get.lazyPut(()=>RoomRepo());
    Get.lazyPut(()=>RoomSearchRepo());
    Get.put(RoomSearchController());
    Get.put(ServicesRepo());
    Get.lazyPut(()=>ReportController());
    Get.lazyPut(()=>ServicesController());
    Get.lazyPut(()=>ReviewRepo());
    Get.lazyPut(()=>BookingRoomRepo(),);
    Get.put(VerfiyCodeController());
    Get.put(Register1Controller());
    Get.put(ResetPasswordCodeController());


    Get.put(HotelHomeController());
   // Get.put(HotelHomeController(Get.arguments));


  }

}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await initialServices();
   //SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    LocaleController controller=Get.put(LocaleController());

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations:MyTranslation() ,
      locale: controller.language,
      theme:ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      //initialRoute: '/hotelhome', // Set your initial route
      getPages: routes,

    );
  }
}


