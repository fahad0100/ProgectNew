




import 'package:appstore/Login/Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'Colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';


Widget ButtonSlider({
  Color baseColor,
  Color highlightedColor,
  Color buttonColor,
  Color backgroundColor,
  double height,
  double width,
  double buttonSize,
  String NameLable,
  action,
  IconData icon,
  Color IconColor,
}){
  baseColor==null ? baseColor= Colors.white : baseColor = baseColor;
  highlightedColor==null ? highlightedColor = Colors.pink:highlightedColor=highlightedColor;
  buttonColor==null ? buttonColor= PrimaryColor:buttonColor=buttonColor;
  backgroundColor==null ? backgroundColor= PrimaryColor.withOpacity(0.5):backgroundColor=backgroundColor;
  height==null ? height= 40:height=height;
  width==null ? width= 210:width=width;
  buttonSize==null ? buttonSize= 40:buttonSize=buttonSize;
  NameLable==null ? NameLable=  "تسجيل الدخول":NameLable=NameLable;
  icon==null ? icon = Icons.lock_open:icon=icon;
  IconColor==null ? IconColor = Colors.white:IconColor=IconColor;
  return Directionality(
    textDirection: ui.TextDirection.ltr,
    child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: SliderButton(
                dismissible: false,
                baseColor: baseColor,
                highlightedColor: highlightedColor,
                buttonColor: PrimaryColor,
                backgroundColor: backgroundColor,
                alignLabel: Alignment.center,
                shimmer: false,
                vibrationFlag: true,
                dismissThresholds: 10.0,
                action: action,
                height: height,
                width: width,
                buttonSize: buttonSize,
                label: Text(
                  NameLable,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                icon: Icon(
                  icon,
                  color: Colors.white,
                )),
          ),
        )),
  );
}

//================================================

orginlWidth(context){
  double width = context.width;
  double height = context.height;
  if (width > height){
    return height;
  }else{
    return width;
  }
}

orginlHeight(context){
  double width = context.width;
  double height = context.height;
  if (width > height){
    return width;
  }else{
    return height;
  }
}

//=================================

 underAlert({String msg,Color textColor,Color backgroundColor}){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0
  );
}

//============================================
FiledCustomerSign({context,String Name,IconData icon,TextEditingController controller,TextStyle labelStyle,bool obscureText}){
  obscureText ==null ? obscureText = false : obscureText = obscureText;
  return Directionality(
      textDirection: context == Locale('en', 'US')
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Center(
          child: Container(
            width: 300,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              obscureText: obscureText,
              textDirection: ui.TextDirection.rtl,
              decoration: new InputDecoration(
                hintStyle: Style,
                labelText: Name.tr(),
                icon: Icon(
                  icon,
                  color: PrimaryColor,
                  size: 20,
                ),
                labelStyle: Style,
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor),
                ),
                focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor),
                ),
              ),
            ),
          )));
 }