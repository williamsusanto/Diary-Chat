import 'package:diary_chat/pages/drawer_header.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,

        //Background
        body: Container(

          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: <Widget>[
              //profile picture
              Positioned(
                top: 40,
                left: 15,
                child: SvgPicture.asset("assets/icons/profile_picture.svg", width: 49, height: 49),
              ),
              //background gradation feature (FIX THE SIZE!!!!!!)
              Positioned(
                  top: 0,
                  left: 20,
                  child: Transform.scale(
                    scaleY: -1,
                    child: SvgPicture.asset('assets/icons/vector12.svg'),
                  )),
              Positioned(
                top: 100,
                left: 97,
                bottom: 10,
                right: 97,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    //Top prompt: Hello I am Manito.
                    Container(

                      child: Text(
                        "Hello,\n I am Manito.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF535353),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              height: 1.1),
                        ),
                      ),
                    ),
                    //Manito image at the center
                    Container(
                      child: Image.asset("assets/images/Manito.png", height: 201, width: 201),
                    ),
                    //Middle prompt: I am here to listen to you?
                    Container(
                      child: Text(
                        "I am here to listen to you!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
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
                        //FIX THIS
                        style: ButtonStyle(),
                          child: Text(
                            'Let\'s talk',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
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
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            height: 0.8333333333333334,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //profile photo icon
            ],
          ),
        ),
        //A drawer shows up when user clicks the profile picture on the left top side
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  HeaderDrawer(),
                  DrawerList(),
                ],
              ),
            ),
          ),
        ),

        //Bottom Navigation Bar which connects to diary page and reminder page
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: 0,
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5), //rgba(183, 182, 241, 0.03)
          selectedItemColor: Color(0xFFEDA981),
          unselectedItemColor: Color(0xFFBBBBC0),
          showUnselectedLabels: false,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          selectedFontSize: 0,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: new SvgPicture.asset("assets/icons/diary_icon.svg",),
              label: ("diary"),
            ),
             BottomNavigationBarItem(
              icon: new SvgPicture.asset("assets/icons/reminder_icon.svg"),
              label: ("reminder"),
            ),
          ],

        ),
      ),
    );
  }
}

Widget DrawerList(){
  return Container();
}
