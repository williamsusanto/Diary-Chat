import 'package:diary_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

//home screen of Manito
//User talk to Manito by clicking Let's Talk button
//User can open a drawer of list of settings by clicking a profile icon
//User also can open diary book shelves by clicking diary icon below
//And open calendar by clicking reminder icon next to it

//index 0 of bottom navigation bar

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
//background gradation feature
          Positioned(
              top: 0,
              left: 20,
              child: Transform.scale(
                scaleY: -1,
                child: SvgPicture.asset('assets/icons/vector12.svg'),
              )),
//profile picture button that can open the drawer
          Positioned(
            top: 35,
            left: 17,
            child: IconButton(
                icon: SvgPicture.asset("assets/icons/profile_picture.svg"),
                iconSize: 49,
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                }),
          ),
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
                  child: Image.asset("assets/images/Manito.png",
                      height: 201, width: 201),
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
        ],
      ),
    );
  }
}
