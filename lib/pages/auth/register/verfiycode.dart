import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/auth/Register/register1.dart';

import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../constant/color.dart';
import '../../../controllers/verfiycode_controller.dart';

class VerfiyCode extends GetView<VerfiyCodeController> {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: TextStyle(fontWeight: FontWeight.bold)
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key:controller.formKey,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check code"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text:
                "Please Enter Your Email Address To Recive a Verification Code"),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Obx(
                    ()=>TextFormField(
                  controller: controller.numberTextController,
                  autovalidateMode: !controller.firstSubmit.value?
                  AutovalidateMode.disabled:
                  AutovalidateMode.always,
                  validator: (String?value){
                    if(value!.isEmpty){
                      return "Required Field";
                    }
                    return null;
                  },

                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter code',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              print(controller.numberTextController.text);
              controller.verfiycode();

            },
                child:Text("checkecode")),
            // CustomButtomAuth(text: "Check", onPressed: () {
            // controller.goToVerfiyCode();
            //}),
            const SizedBox(height: 40),

          ]),
        ),
      ),



    );


  }
}
