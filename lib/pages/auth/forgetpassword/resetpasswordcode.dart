import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../constant/color.dart';
import '../../../controllers/resetpasswordcode_controller.dart';
import '../../../controllers/verfiycode_controller.dart';
import '../Register/register1.dart';

/*
class ResetPasswordCode extends GetView<ResetPassowrdCodeController>{
  const ResetPasswordCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassowrdCodeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Reset Password Code',
            style: TextStyle(fontWeight: FontWeight.bold)
                .copyWith(color: AppColor.grey)),
      ),
      body:


      Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check Code"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
              "Please Enter The Code Sent To "),
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
                controller: controller.emailTextController,
                autovalidateMode: !controller.firstSubmit.value?
                AutovalidateMode.disabled:
                AutovalidateMode.always,
                validator: (String?value){
                  if(value!.isEmpty){
                    return "Required Field";
                  }else if(!GetUtils.isEmail(value)){
                    return "Wrong Email";
                  }
                  return null;
                },

                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Email',
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
          const SizedBox(height: 20),
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
                controller: controller.codeTextController,
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
                  hintText: 'Enter Code',
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
          const SizedBox(height: 20),
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
                  ()=> TextFormField(
                controller: controller.passwordTextController,
                autovalidateMode: !controller.firstSubmit.value?
                AutovalidateMode.disabled
                    :AutovalidateMode.always,
                validator: (String ? value){
                  if(value!.isEmpty){
                    return "Required Field";
                  }
                  return null;
                },
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),

          ),
          const SizedBox(height: 20),
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
                  ()=> TextFormField(
                controller: controller.newpasswordTextController,
                autovalidateMode: !controller.firstSubmit.value?
                AutovalidateMode.disabled
                    :AutovalidateMode.always,
                validator: (String ? value){
                  if(value!.isEmpty){
                    return "Required Field";
                  }
                  return null;
                },
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),

          ),

//lorydemirgian02@gmail.com
          SizedBox(height: 40),
        ]),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../controllers/sendresetpassword_contoller.dart';

/*
class ResetPasswordCode extends GetView<ResetPasswordCodeController>  {
  const ResetPasswordCode ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordCodeController());
    return Scaffold(
        body:
        Stack(
            children: [
              Positioned.fill(
                  child: Container(
                    color: Colors.black, // Change this to the color you want
                  )
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                      bottomRight: Radius.circular(0.0), // Adjust this value as needed
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.width / 0.5,
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(children: [
                      const SizedBox(height: 50),
                      CustomTextTitleAuth(text: "7"),
                      const SizedBox(height: 17),
                      CustomTextBodyAuth(text: "13"),
                      const SizedBox(height: 30),
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
                            controller: controller.emailTextController,
                            autovalidateMode: !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            validator: (String?value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }else if(!GetUtils.isEmail(value)){
                                return "Wrong Email";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '8'.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Icons.email_outlined),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
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
                            controller: controller.codeTextController,
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
                              hintText: '14'.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Icons.code),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
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
                              ()=> TextFormField(
                            controller: controller.passwordTextController,
                            autovalidateMode: !controller.firstSubmit.value?
                            AutovalidateMode.disabled
                                :AutovalidateMode.always,
                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '15'.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Icons.lock_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 15,),
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
                              ()=> TextFormField(
                            controller: controller. newpasswordTextController,
                            autovalidateMode: !controller.firstSubmit.value?
                            AutovalidateMode.disabled
                                :AutovalidateMode.always,
                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '16'.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Icons.lock_outline),
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
                      CustomButtomAuth(text: "17", onPressed: () {
                        controller.resetpasswordcode();
                      }),

                    ]),
                  ),
                ),
              ),

            ]
        )
    );
  }
}
*/

//TODO HAD EL CODE EL ADIM
/*
class ResetPasswordCode extends GetView<ResetPasswordCodeController> {
  const ResetPasswordCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordCodeController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black, // Change this to the color you want
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                  bottomRight: Radius.circular(0.0), // Adjust this value as needed
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.width / 0.5,
              padding: EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 50),
                    CustomTextTitleAuth(text: "7"),
                    const SizedBox(height: 17),
                    CustomTextBodyAuth(text: "13"),
                    const SizedBox(height: 30),
                    _buildTextFormField(
                      controller: controller.emailTextController,
                      hintText: '8'.tr,
                      icon: Icons.email_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        } else if (!GetUtils.isEmail(value)) {
                          return "Wrong Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    _buildTextFormField(
                      controller: controller.codeTextController,
                      hintText: '14'.tr,
                      icon: Icons.code,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    _buildTextFormField(
                      controller: controller.passwordTextController,
                      hintText: '15'.tr,
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    _buildTextFormField(
                      controller: controller.newpasswordTextController,
                      hintText: '16'.tr,
                      icon: Icons.lock_outline,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButtomAuth(
                      text: "17",
                      onPressed: () {
                        controller.resetpasswordcode();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return Container(
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
            () => TextFormField(
          controller: controller,
          autovalidateMode: !this.controller.firstSubmit.value
              ? AutovalidateMode.disabled
              : AutovalidateMode.always,
          validator: validator,
          obscureText: obscureText,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
*/


class ResetPasswordCode extends GetView<ResetPasswordCodeController> {
  const ResetPasswordCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust horizontal padding as needed
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
            children: [
              SizedBox(height: 10), // Top space
              Text(
                "13".tr,
                style: TextStyle(color: Colors.black, fontSize: 35),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 6), // Space between title and subtitle
              Text(
                "7".tr,
                style: TextStyle(color: Colors.grey, fontSize: 15),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: 50), // Space below subtitle

             /* // Email Text Form Field
              _buildTextFormField(
                controller: controller.emailTextController,
                hintText: '8'.tr,
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  } else if (!GetUtils.isEmail(value)) {
                    return "Wrong Email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              // Code Text Form Field
              _buildTextFormField(
                controller: controller.codeTextController,
                hintText: '14'.tr,
                icon: Icons.code,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              // Password Text Form Field
              _buildTextFormField(
                controller: controller.passwordTextController,
                hintText: '15'.tr,
                icon: Icons.lock_outline,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              // New Password Text Form Field
              _buildTextFormField(
                controller: controller.newpasswordTextController,
                hintText: '16'.tr,
                icon: Icons.lock_outline,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  }
                  return null;
                },
              ),*/

              Obx(
                    () => TextFormField(
                  controller: controller.emailTextController,
                  autovalidateMode: !controller.firstSubmit.value
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.always,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Required Field";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Wrong Email";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: '8'.tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Icon(Icons.email, color: Colors.grey), // Email icon on the right side
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                    () => TextFormField(
                  controller: controller.codeTextController,
                  autovalidateMode: !controller.firstSubmit.value
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.always,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: '8'.tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Icon(Icons.code, color: Colors.grey), // Email icon on the right side
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                    () => TextFormField(
                  controller: controller.passwordTextController,
                  autovalidateMode: !controller.firstSubmit.value
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.always,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: '8'.tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey), // Email icon on the right side
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                    () => TextFormField(
                  controller:  controller.newpasswordTextController,
                  autovalidateMode: !controller.firstSubmit.value
                      ? AutovalidateMode.disabled
                      : AutovalidateMode.always,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: '8'.tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Colors.grey), // Email icon on the right side
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              // Submit Button
            /*  CustomButtomAuth(
                text: "17",
                onPressed: () {
                  controller.resetpasswordcode();
                },
              ),*/
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  controller.resetpasswordcode();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF003398)),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20), // Adjust padding as needed
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "17".tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    // Ensure we are referring to the main controller here
    final mainController = Get.find<ResetPasswordCodeController>();

    return Container(
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
            () => TextFormField(
          controller: controller,
          autovalidateMode: !mainController.firstSubmit.value
              ? AutovalidateMode.disabled
              : AutovalidateMode.always,
          validator: validator,
          obscureText: obscureText,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(icon, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
    );
  }
}


