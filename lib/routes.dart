


import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled1/pages/Language.dart';
import 'package:untitled1/pages/auth/Register/checkemail.dart';
import 'package:untitled1/pages/auth/Register/register1.dart';
import 'package:untitled1/pages/auth/Register/verfiycode.dart';
import 'package:untitled1/pages/auth/forgetpassword/resetpasswordcode.dart';
import 'package:untitled1/pages/auth/forgetpassword/sendresetpassword.dart';
import 'package:untitled1/pages/auth/login.dart';
import 'package:untitled1/pages/onboarding.dart';

import 'constant/routes.dart';

List<GetPage<dynamic>>? routes =[
  //GetPage(name: "/", page: ()=> const Language()),
 // GetPage(name:"/", page: ()=>const OnBoarding()),
//  GetPage(name:AppRoute.language, page: ()=>const Language()),

 // GetPage(name:"/", page: ()=> const Login()),
  GetPage(name:"/", page: ()=> const Checkemail()),
//  GetPage(name:AppRoute.login, page: ()=> const Login()),
  GetPage(name:AppRoute.checkemail, page: () => Checkemail()),
  GetPage(name:AppRoute.verifycode, page: () => VerfiyCode()),
  GetPage(name: AppRoute.verifycode, page: () => VerfiyCode()),
  GetPage(name:AppRoute.register1 , page:()=>Register1()),
  GetPage(name:AppRoute.sendresetpassword , page:()=>SendResetPassword()),
  GetPage(name: AppRoute.resetpasswordcode, page:()=>ResetPasswordCode()),

];