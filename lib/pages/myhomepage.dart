import 'package:diary_chat/widgets/profile_drawer.dart';
import 'package:diary_chat/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diary_chat/screens/bookshelf.dart';
import '../screens/home_screen.dart';
import '../screens/reminder.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  int _currentIndex = 1;

  final tabs = [
    BookShelf(),
    HomeScreen(),
    Reminder(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: tabs[_currentIndex],
        drawer: Profile_Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
            elevation: 0,
            backgroundColor: Color(0xFFF5F5F5),
            showUnselectedLabels: false,
            unselectedFontSize: 0,
            showSelectedLabels: false,
            selectedFontSize: 0,

          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/diary_icon.svg",
                color: _currentIndex == 0 ? Color(0xFFEDA981) : Color(0xFFBBBBC0)),
                label: "Diary"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "homescreen"),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/reminder_icon.svg",
                color: _currentIndex == 2 ? Color(0xFFEDA981) : Color(0xFFBBBBC0)),
                label: "Reminder"),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
        ),
      ),
    );
  }
}
