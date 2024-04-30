
import 'package:flutter/material.dart';


class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  static const Color customColor=Color.fromRGBO(255, 160, 42, 1.0);


  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(top: 10),
        child:
        /* MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
      ),*/
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(customColor), // Set button color
            // Set button color
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Text style
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
            elevation: MaterialStateProperty.all<double>(7), // Elevation
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // BorderRadius
              ),
            ),
          ),
          child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
        )

    );
  }
}


