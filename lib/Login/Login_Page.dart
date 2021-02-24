import 'package:appstore/Auth/Auth_Services.dart';
import 'package:appstore/PublicFile/Colors.dart';
import 'package:appstore/PublicFile/Comp.dart';
import 'package:appstore/Register/SignUp_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'dart:ui' as ui;

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

var Style = TextStyle(color: PrimaryColor);

class _Login_PageState extends State<Login_Page> {
  double Width;
  double Hight;
  double WidthScreen;
  double HightScreen;
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Width = MediaQuery.of(context).size.width;
    Hight = MediaQuery.of(context).size.height;
    WidthScreen = orginlWidth(MediaQuery.of(context).size);
    HightScreen = orginlHeight(MediaQuery.of(context).size);
    //progress

    //progress
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  height: Width == WidthScreen
                      ? WidthScreen - 100
                      : WidthScreen / 2,
                  width: Width,
                  decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              MediaQuery.of(context).size.width))),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Width == WidthScreen
                            ? WidthScreen / 8
                            : WidthScreen / 20),
                    child: Image(
                      image: AssetImage("images/1.png"),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    right: 10,
                    child: FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          context.locale == Locale('en', 'US')
                              ? context.locale = Locale('ar', 'SA')
                              : context.locale = Locale('en', 'US');
                        },
                        child: context.locale == Locale('en', 'US')
                            ? Text("English")
                            : Text("عربي"))),
              ],
            ),
            SizedBox(height: Width == WidthScreen ? 40 : 20),
            FiledCustomerSign(
                Name: "EmailLable".tr(),
                context: context.locale,
                icon: Icons.email,
                controller: Email),
            FiledCustomerSign(
                Name: "PasswordLable".tr(),
                context: context.locale,
                obscureText: true,
                icon: Icons.lock,
                controller: Password),
            Align(
              alignment: context.locale == Locale('en', 'US')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Padding(
                  padding: context.locale == Locale('en', 'US') ? EdgeInsets.only(right: Width == WidthScreen ? 20 : Width/3.6):EdgeInsets.only(left: Width == WidthScreen ? 20 : Width/3.6),
                  // EdgeInsets.only(left: Width == WidthScreen ? 200 : 100)
                  child: FlatButton(
                    child: Text(
                      "ForgotLable".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/Forgotten_Page', (Route<dynamic> route) => true);
                    },
                  )),
            ),
            ButtonSlider(
                NameLable: "SignInLable".tr(),
                width: 230,
                action: () async {
                  var signIn = await context.read<Auth_Service>().signIn(
                      Email: Email.text.toString(),
                      Password: Password.text.toString());
                  setState(() {
                    if (signIn != "Sign In") {
                      underAlert(
                          msg: "SignInNotWork".tr(),
                          backgroundColor: PrimaryColor,
                          textColor: Colors.white);
                    } else {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/AuthenticationPage', (Route<dynamic> route) => true);
                      underAlert(
                          msg: "SignInSucceeded".tr(),
                          backgroundColor: PrimaryColor,
                          textColor: Colors.white);

                    }
                  });
                }),
            SizedBox(height: 150),
            FlatButton(
              child: Text("SignUp".tr(), style: TextStyle(color: PrimaryColor)),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/SignUp_Page', (Route<dynamic> route) => false);
              },
            ),
            SizedBox(height: Width == WidthScreen ? 0 : 50),
          ],
        ),
      ),
    );
  }
}
