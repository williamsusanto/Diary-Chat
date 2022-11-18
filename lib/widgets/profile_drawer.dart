import 'package:flutter/material.dart';
import 'package:diary_chat/pages/myhomepage.dart';

class Profile_Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Drawer(
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
    const DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.blue,
    ),
    child: Text('Drawer Header'),
    ),
    ListTile(
    leading: Icon(
    Icons.home,
    ),
    title: const Text('Page 1'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    leading: Icon(
    Icons.train,
    ),
    title: const Text('Page 2'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ],
    ),
    );
  }
}