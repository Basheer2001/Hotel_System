import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/constant/onboarding/static_onboarding.dart';

import '../../controllers/onboarding_controller.dart';
import '../../pages/Language.dart';
import '../../pages/auth/login.dart';


class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  static const Color customColor=Color.fromRGBO(255, 160, 42, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
    if (controller.currentPage.value == onBoardingList.length - 1) {
    // Navigate to the language page
    Get.to(Login());
    } else {
    // Move to the next onboarding screen
    controller.next();
    }
    },
          color:customColor,
         // color: AppColor.primaryColor,
          child:  Text("27".tr)),
    );
  }
}