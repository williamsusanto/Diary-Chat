import 'package:diary_chat/pages/pages.dart';
import 'package:diary_chat/screens/chats_screen.dart';
import 'package:diary_chat/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary_chat/pages/myhomepage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ValueNotifier<String> title = ValueNotifier('Chats');

  final Screen = ChatsScreen();

  final pageTitle = 'Chats';

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1700), () {});
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomepage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double safeHeight = height - padding.top - padding.bottom;

    return Material(
      child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 293,
                left: width / 2 - 86,
                child: Container(
                    width: 172,
                    height: 83,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 11,
                          child: Container(
                              width: 19,
                              height: 19,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(108, 161, 120, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(20, 19)),
                              ))),
                      Positioned(
                          top: 0,
                          left: 141,
                          child: Container(
                              width: 19,
                              height: 19,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(19, 19)),
                              ))),
                      Positioned(
                          top: 10,
                          left: 46,
                          child: SvgPicture.asset('assets/icons/smile.svg')),
                      Positioned.fill(
                          top: 66,
                          left: 0,
                          child: Text(
                            'MANITO',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.josefinSlab(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 40,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w700,
                                height: 0.425),
                          )),
                    ]))),
            Positioned(
                top: 413,
                left: 0,
                width: width,
                child: SvgPicture.asset('assets/icons/vector8.svg')),
            Positioned(
                top: 531.5,
                left: 0,
                width: width,
                child: Transform.scale(
                  scaleX: -1,
                  child: SvgPicture.asset('assets/icons/vector7.svg'),
                )),
            Positioned(
                top: 642.5,
                left: 0,
                width: width,
                child: SvgPicture.asset('assets/icons/vector9.svg')),
          ])),
    );
  }
}
