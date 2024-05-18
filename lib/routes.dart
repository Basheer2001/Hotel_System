import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled1/pages/Language.dart';
import 'package:untitled1/pages/auth/Register/checkemail.dart';
import 'package:untitled1/pages/auth/Register/register1.dart';
import 'package:untitled1/pages/auth/Register/verfiycode.dart';
import 'package:untitled1/pages/auth/forgetpassword/resetpasswordcode.dart';
import 'package:untitled1/pages/auth/forgetpassword/sendresetpassword.dart';
import 'package:untitled1/pages/homepage/homepage.dart';
import 'package:untitled1/pages/onboarding.dart';
import 'package:untitled1/pages/profile/profile.dart';
import 'constant/routes.dart';
import 'pages/auth/login/login.dart';
import 'pages/profile/updateprofile.dart';

List<GetPage<dynamic>>? routes =[
 // GetPage(name: "/", page: ()=> const Language()),
  GetPage(name:AppRoute.onBoarding, page: ()=>const OnBoarding()),
  GetPage(name:AppRoute.login, page: ()=> const Login()),
  GetPage(name:AppRoute.checkemail, page: () => Checkemail()),
  GetPage(name:AppRoute.verifycode, page: () => VerfiyCode()),
  GetPage(name: AppRoute.verifycode, page: () => VerfiyCode()),
  GetPage(name:AppRoute.register1 , page:()=>Register1()),
  GetPage(name:AppRoute.sendresetpassword , page:()=>SendResetPassword()),
  GetPage(name: AppRoute.resetpasswordcode, page:()=>ResetPasswordCode()),
  //GetPage(name:"/", page:()=>HotelHome()),
 // GetPage(name: "/", page:()=>Profile()),
  GetPage(name: AppRoute.profile, page:()=>Profile()),
  GetPage(name: AppRoute.uodateprofile, page:()=>UpdateProfile()),
  GetPage(name: "/", page:()=>HotelHome()),
  GetPage(name: AppRoute.hotelhome, page:()=>HotelHome()),



];