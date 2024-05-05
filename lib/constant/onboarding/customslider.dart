import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/constant/onboarding/static_onboarding.dart';
import '../../controllers/onboarding_controller.dart';
import '../color.dart';


class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val) ;
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            SizedBox(height: 35,),
            Text(onBoardingList[i].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 40),
            Image.asset(
              onBoardingList[i].image!,
             // width: MediaQuery.of(context).size.width * 0.6, // Example: 60% of screen width
              height: MediaQuery.of(context).size.height * 0.5, // Example: 40% of screen height
              fit: BoxFit.cover,

            ),
            const SizedBox(height: 40),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )),
          ],
        ));
  }
}