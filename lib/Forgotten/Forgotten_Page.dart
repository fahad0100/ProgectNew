import 'package:flutter/cupertino.dart';
import 'package:appstore/Auth/Auth_Services.dart';
import 'package:appstore/PublicFile/Colors.dart';
import 'package:appstore/PublicFile/Comp.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:gradient_loading_button/gradient_loading_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:ui' as ui;

class Forgotten_Page extends StatefulWidget {
  @override
  _Forgotten_PageState createState() => _Forgotten_PageState();
}

class _Forgotten_PageState extends State<Forgotten_Page> {
  double Width;
  double Hight;
  double WidthScreen;
  double HightScreen;
  Color ColorLabel = PrimaryColor;
  Color backColor = Colors.white;
  TextEditingController Email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Width = MediaQuery.of(context).size.width;
    Hight = MediaQuery.of(context).size.height;
    WidthScreen = orginlWidth(MediaQuery.of(context).size);
    HightScreen = orginlHeight(MediaQuery.of(context).size);
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
                Positioned(
                    top: 40,
                    left: 10,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/Login_Page', (Route<dynamic> route) => true);
                        },
                        child: Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        )))
              ],
            ),
            SizedBox(height: Width == WidthScreen ? 50 : 30),
            FiledCustomerSign(
              Name: "EmailLable".tr(),
              context: context.locale,
              icon: Icons.email,
              controller: Email,
            ),
            SizedBox(height: Width == WidthScreen ? 40 : 50),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 40,
                    child: LoadingButton(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: new LinearGradient(
                          colors: <Color>[PrimaryColor, PrimaryColor]),
                      strokeWidth: 1,
                      animationDuration: Duration(milliseconds: 1000),
                      child: Text(
                        "RestorePassword".tr(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      errorChild: const Icon(
                        Icons.close_sharp,
                        color: Colors.white,
                      ),
                      successChild: const Icon(
                        Icons.check_sharp,
                        color: Colors.white,
                      ),
                      onPressed: (controller) async {
                        await controller.loading();
                        final reaet = await context
                            .read<Auth_Service>()
                            .ForgottenEmail(Email: Email.text.trim());
                        if (reaet == "Email Reset") {
                          underAlert(
                              msg: "تحقق من بريدك الالكتروني".tr(),
                              textColor: Colors.black,
                              backgroundColor: Colors.green);
                          controller.success();
                        }else{
                          underAlert(
                              msg: "لم نجد البريد الألكتروني".tr(),
                              textColor: Colors.black,
                              backgroundColor: PrimaryColor);
                          controller.error();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
