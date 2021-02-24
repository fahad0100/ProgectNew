
import 'package:appstore/Auth/Auth_Services.dart';
import 'package:appstore/PublicFile/Colors.dart';
import 'package:appstore/PublicFile/Comp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:gradient_loading_button/gradient_loading_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:ui' as ui;

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PagePageState createState() => _SignUp_PagePageState();
}

var Style = TextStyle(color: PrimaryColor);

class _SignUp_PagePageState extends State<SignUp_Page> {
  double Width;
  double Hight;
  double WidthScreen;
  double HightScreen;
  Color ColorLabel = PrimaryColor;
  Color backColor = Colors.white;
  final databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController NameStore = TextEditingController();
  TextEditingController NamePerson = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController PhonePerson = TextEditingController();
  TextEditingController PhoneStore = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController re_Password = TextEditingController();

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
            Center(
              child: Text(
                "SignUpLabel".tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: Width == WidthScreen ? 10 : 20),
            FiledCustomerSign(
                Name: "NameStor".tr(),
                context: context.locale,
                icon: Icons.store_sharp,
                controller: NameStore),
            FiledCustomerSign(
                Name: "NamePersonStor".tr(),
                context: context.locale,
                icon: Icons.person,
                controller: NamePerson),
            FiledCustomerSign(
                Name: "EmailLable".tr(),
                context: context.locale,
                icon: Icons.email,
                controller: Email),
            FiledCustomerSign(
                Name: "PhonePerson".tr(),
                context: context.locale,
                icon: Icons.contact_phone_rounded,
                controller: PhonePerson),
            FiledCustomerSign(
                Name: "PhoneStor".tr(),
                context: context.locale,
                icon: Icons.lock,
                controller: PhoneStore),
            FiledCustomerSign(
                Name: "PasswordLable".tr(),
                obscureText: true,
                context: context.locale,
                icon: Icons.lock,
                controller: Password),
            FiledCustomerSign(
                Name: "Re-Password".tr(),
                obscureText: true,
                context: context.locale,
                icon: Icons.lock,
                controller: re_Password),
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
                        "Create".tr(),
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
                        color: Colors.green,
                      ),
                      onPressed: (controller) async {
                        setState(() async {
                          await controller.loading();
                          // await new Future.delayed( const Duration( seconds: 5 ) );

                          if (NameStore.text != "" &&
                              NameStore.text != " " &&
                              NameStore.text != "  " &&
                              NameStore.text.isEmpty != true &&
                              NamePerson.text != "" &&
                              NamePerson.text != " " &&
                              NamePerson.text != "  " &&
                              NamePerson.text.isEmpty != true &&
                              Email.text != "" &&
                              Email.text != " " &&
                              Email.text != "  " &&
                              Email.text.isEmpty != true &&
                              PhonePerson.text != "" &&
                              PhonePerson.text != " " &&
                              PhonePerson.text != "  " &&
                              PhonePerson.text.isEmpty != true &&
                              PhoneStore.text != "" &&
                              PhoneStore.text != " " &&
                              PhoneStore.text != "  " &&
                              PhoneStore.text.isEmpty != true &&
                              Password.text != "" &&
                              Password.text != " " &&
                              Password.text != "  " &&
                              Password.text.isEmpty != true) {
                            if (Password.text == re_Password.text) {
                              // await new Future.delayed(
                              //     const Duration(seconds: 3));
                              var SignUp =
                                  await context.read<Auth_Service>().signUp(
                                        Email: Email.text.trim(),
                                        Password: Password.text.trim(),
                                      );
                              if (SignUp == "Sign Up") {
                                var id = await context
                                    .read<Auth_Service>()
                                    .Auth_ID();

                                var data = {
                                  "NameStore": NameStore.text,
                                  "NamePerson": NamePerson.text,
                                  "Email": Email.text,
                                  "PhonePerson": PhonePerson.text,
                                  "PhoneStore": PhoneStore.text,
                                  "Password1": Password.text,
                                  "ID": id
                                };
                                databaseReference
                                    .child("ShopStore")
                                    .child(id.toString())
                                    .child("Data")
                                    .set(data)
                                    .then((value) {
                                  print("sssssssss");
                                });
                                await controller.success();
                              } else {
                                underAlert(
                                    msg: "msgSignUp1".tr(),
                                    textColor: Colors.black,
                                    backgroundColor: PrimaryColor);
                                await controller.error();
                              }
                            } else {
                              underAlert(
                                  msg: "msgSignUp2".tr(),
                                  textColor: Colors.white,
                                  backgroundColor: PrimaryColor);
                            }
                          } else
                            underAlert(
                                msg: "msgSignUp3".tr(),
                                textColor: Colors.white,
                                backgroundColor: PrimaryColor);
                          await controller.error();
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: Width == WidthScreen ? 40 : 50),
          ],
        ),
      ),
    );
  }
}
