import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/auth/custombottomauth.dart';
import '../../../constant/auth/customtextbodyauth.dart';
import '../../../constant/auth/customtexttitleauth.dart';
import '../../../controllers/profile_Controller.dart';

/*class UpdateProfile extends GetView<ProfileController>{
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(ProfileController());

    return Scaffold(

        backgroundColor: Colors.transparent,
        body:
        Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Container(
                  color: Colors.black, // Change this to the color you want
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6), // Adjust the opacity here
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
                  width: MediaQuery.of(context).size.width /0.25,
                  height: MediaQuery.of(context).size.width / 0.5,
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(children: [
                      CustomTextTitleAuth(text: "5"),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "10"),
                      const SizedBox(height: 15),
                      GestureDetector(
                          onTap: () =>

                              controller.pickImage(context),

                          child: Obx(
                                ()=> CircleAvatar(
                              minRadius: 35,
                              maxRadius: 35,
                              backgroundImage:
                              controller.avatarImagePath.value.isEmpty
                                  ?null
                                  :FileImage(File(controller.avatarImagePath.value)) ,

                              child: controller.avatarImagePath.isEmpty
                                  ? Icon(Icons.add_a_photo) // Display an icon if no image is selected
                                  : null,
                            ),)
                      ),
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
                            //  controller: controller.firstnameTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.firstnameTextController,
                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '23'.tr,
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
                        child:Obx(
                              ()=> TextFormField(
                            //  controller: controller.firstnameTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.lastnameTextController,
                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '22'.tr,
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
                              ()=> TextFormField(
                            //   controller: controller.passwordTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.newpasswordTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter Passowrd',
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
                              ()=> TextFormField(
                            //   controller: controller.passwordTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller. newpasswordconfirmation,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '21'.tr,
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
                              ()=> TextFormField(
                            // controller: controller.addressTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.currentpassword,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '32'.tr,
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
                              ()=> TextFormField(
                            // controller: controller.addressTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.phoneTextController,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '18'.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),  const SizedBox(height: 15),

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
                            // controller: controller.addressTextController,
                            autovalidateMode:  !controller.firstSubmit.value?
                            AutovalidateMode.disabled:
                            AutovalidateMode.always,
                            controller: controller.address,

                            validator: (String ? value){
                              if(value!.isEmpty){
                                return "Required Field";
                              }
                              return null;
                            },

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: '20'.tr,
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
                      CustomButtomAuth(text: "Update", onPressed: () {
                        controller.updateprofile();

                      }),



                    ]),
                  ),
                ),
              )




            ])
    );

  }}*/



