import 'package:diary_chat/screens/screens.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diary_chat/screens/bookshelf.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _currentIndex = 0;
  final List<Widget> _children = [BookShelf(), BookShelf()];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,

        //Background
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(),
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
                            color: Color(0xFF535353),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            height: 1.1),
                      ),
                    ),
                  ),
                  //Manito image at the center
                  Container(
                    child: Image.asset("assets/images/Manito.png"),
                  ),
                  //Middle prompt: I am here to listen to you?
                  Container(
                    child: Text(
                      "I am here to listen to you!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF535353),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 0.8333333333333334,
                        ),
                      ),
                    ),
                    //'What can I interest you in\n today ? ',
                    //textAlign: TextAlign.center,
                    //style: TextStyle(

                    //),
                  ),
                  //"Let's Chat" Button leads user to the chat room (chat_screen.dart)
                  Container(
                    width: 192,
                    height: 63,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        },
                        child: Text(
                          'Let\'s talk',
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        )),
                  ),
                  //Bottom prompt: Or say "Hey, Manito!"
                  Container(
                    child: Text(
                      "Or say “Hey, Manito!”",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xFF535353),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 0.8333333333333334,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //profile photo icon
            ],
          ),
        ),
        //Bottom Navigation Bar which connects to diary page and reminder page
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5), //rgba(183, 182, 241, 0.03)
          selectedLabelStyle: TextStyle(fontSize: 0),
          unselectedLabelStyle: TextStyle(fontSize: 0),
          selectedItemColor: Color(0xFFEDA981),
          onTap: (index) => {},
          currentIndex: 0,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/diary_icon.svg"),
              label: ("diary"),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/reminder_icon.svg"),
              label: ("reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
