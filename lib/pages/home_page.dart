import 'package:diary_chat/screens/screens.dart';
import 'package:diary_chat/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Transform.scale(
                scaleY: -1,
                child: SvgPicture.asset('assets/icons/vector12.svg',
                    semanticsLabel: 'vector12'),
              )),
          Positioned(
              top: 120,
              left: 97,
              child: Material(
                color: AppColors.cardLight.withOpacity(0),
                child: Text(
                  'Hello,\n I am Manito.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.text,
                    backgroundColor: AppColors.cardLight.withOpacity(0),
                    fontSize: 32,
                  ),
                ),
              )),
          Center(
            child: Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(0, -0.2),
                  image: AssetImage('assets/images/Manito.png')),
            )),
          ),
          Center(
              child: Material(
            child: Text(
              'What can I interest you in\n today ? ',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 0.8333333333333334),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 9.5,
            child: Container(
              width: 192,
              height: 63,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Text(
                    'Let\'s talk',
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          Positioned(
              top: 680,
              left: 68,
              child: Material(
                child: Text(
                  'Or say “Hey, Manito!”',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: AppColors.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 0.8333333333333334),
                ),
              )),
          Positioned(
              top: 722,
              left: 162,
              child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(138, 136, 209, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(65, 65)),
                  ))),
          Positioned(top: 736, left: 182, child: Icon(Icons.mic)),
        ]));
  }
}
