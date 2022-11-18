import 'package:flutter/material.dart';
import 'package:diary_chat/pages/myhomepage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


//when user clicks the profile icon it will open a drawer
//A drawer that user can access user information, chatbot settings, app settings, notifications
class Profile_Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: const Color(0xffFFFFFF)),
            accountName: Text(
              "User Name",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            accountEmail: Text(
              "username@example.com",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ),
            currentAccountPicture: SvgPicture.asset("assets/icons/profile_picture.svg",),
          ),
          Divider(
            thickness: 0.5,
            indent: 30,
            endIndent: 30,
            color: Color(0xFFBBBBC0),
          ),
          ListTile(
            leading: Icon(
              Icons.chat,
            ),
            title: Text('Chatbot Settings',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
              color: Color(0xFF535353),
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: 1,
            ),),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text('App Settings',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
            ),
            title: Text('Notifications',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
