import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


//when user clicks the profile icon it will open a drawer
//A drawer that user can access user information, chatbot settings, app settings, notifications
class Profile_Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFFFFFFF),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(color: const Color(0xffFFFFFF),),
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
            currentAccountPicture: SvgPicture.asset(
              "assets/icons/profile_picture.svg",
            ),
          ),
          Divider(
            thickness: 0.7,
            indent: 30,
            endIndent: 30,
            color: Color(0xFFBBBBC0),
          ),

          ListTile(

            leading: Icon(
              Icons.chat,
            ),
            title: Text(
              'Chatbot Settings',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'App Settings',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
            ),
            title: Text(
              'Notifications',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          Expanded(
              child: Container(
                height: 120,
              )
          ),

          Divider(
            thickness: 0.7,
            indent: 30,
            endIndent: 30,
            color: Color(0xFFBBBBC0),
          ),

          ListTile(
            leading: Icon(
              Icons.help,
            ),
            title: Text(
              'Help',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.policy,
            ),
            title: Text(
              'Policy',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: Text(
              'Log out',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
