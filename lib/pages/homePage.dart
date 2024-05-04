import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/auth/customtextbodyauth.dart';
import '../constant/auth/customtexttitleauth.dart';
import '../constant/color.dart';
class HomePage extends StatelessWidget  {
  const HomePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Home Page',
            style: TextStyle(fontWeight: FontWeight.bold)
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(),
    );
  }

}