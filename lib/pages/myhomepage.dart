import 'package:diary_chat/screens/screens.dart';
import 'package:diary_chat/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:diary_chat/screens/bookshelf_bottom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,

        //Background
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            //background color
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          child: Stack(
            children: <Widget>[
              //background gradation feature (have to be fixed)
              Positioned(
                  top: 0,
                  child: Transform.scale(
                    scaleY: -1,
                    child: SvgPicture.asset('assets/icons/vector12.svg',
                        semanticsLabel: 'vector12'),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Top prompt: Hello I am Manito.
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "Hello,\n I am Manito.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(82, 82, 82, 1),
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            height: 1.1),
                      ),
                    ),
                  ),
                  //Manito image at the center
                  Container(
                    child: Image.asset("assets/images/Manito.png"),
                  ),
                  //Bottom prompt: What can I interest you in today?
                  Container(
                    child: Text(
                      "What can I interest you in\ntoday?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(82, 82, 82, 1),
                          fontSize: 24,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 0.8333333333333334,
                        ),
                      ),
                    ),
                    //'What can I interest you in\n today ? ',
                    //textAlign: TextAlign.center,
                    //style: TextStyle(

                    //),
                  ),
                ],
              ),

              //profile photo icon
            ],
          ),
        ),

        ),
      );
  }
}
