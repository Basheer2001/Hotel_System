import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controllers/login_controller.dart';
import 'forgetpassword/resetpassword.dart';


class Login extends GetView<loginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/p.jpg"), // Path to your image
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter, // Align the container to the bottom center
        child:
        Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
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
            key:controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "WELCOME TO OUR APP",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 60,),
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
                      controller: controller.usernameTextController,
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
                SizedBox(height: 20,),
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
                      controller: controller.PasswordTextController,
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

                Row(
                  children: [
                    Obx(
                          ()=>controller.loginLoadingState.value?
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                            elevation: MaterialStateProperty.all<double>(7), // Elevation
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius
                              ),
                            ),
                          ),
                          child:SizedBox(width: 20,height: 20,child: CircularProgressIndicator(),)
                      ):
                      ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                            elevation: MaterialStateProperty.all<double>(7), // Elevation
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // BorderRadius
                              ),
                            ),
                          ),
                          child: Text('Sign In')
                      ),
                    ),
                    SizedBox(width: 30,),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => ResetPassword());

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
                        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                        elevation: MaterialStateProperty.all<double>(7), // Elevation
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                        ),
                      ),
                      child: Text('Forget password'),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}