import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Auth/Auth_Services.dart';
import 'Forgotten/Forgotten_Page.dart';
import 'Login/Login_Page.dart';
import 'Register/SignUp_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'),Locale('ar', 'SA')],
        fallbackLocale: Locale('en', 'US'),
        saveLocale: true,
        path: 'Languages', // <-- change patch to your
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth_Service>(
            create: (_) => Auth_Service(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.read<Auth_Service>().authStateChanges)
      ],
      child: MaterialApp(
        title: 'Clean Code',
        routes: {
          '/SignUp_Page':(context) => SignUp_Page(),
          '/Login_Page':(context) => Login_Page(),
          '/Forgotten_Page':(context) => Forgotten_Page(),
          '/AuthenticationPage':(context) => AuthenticationPage(),
        },
        debugShowCheckedModeBanner: false,

        localizationsDelegates: [
          // context.localizationDelegates;
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,


        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: AnimatedSplashScreen(
          duration: 1,
          animationDuration: Duration(seconds: 1),
          splashIconSize: 400,
          splash: Column(
            children: [
              Image(
                image: AssetImage("images/4.png"),
                height: 300,
                width: 300,
              ),
              Text(
                "مرحبا بك",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              )
            ],
          ),
          nextScreen: AuthenticationPage(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return FlatButton(onPressed: (){
        context.read<Auth_Service>().signOut();
      }, child: Text("SignOut"));
    } else {
      return Login_Page();
    }
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("data"),
//       ),
//     );
//   }
// }
