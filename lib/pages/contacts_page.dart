import 'package:diary_chat/screens/bookshelf.dart';
import 'package:diary_chat/pages/myhomepage.dart';
import 'package:flutter/material.dart';
// Don't delete this one yet. I'm testing the transition here...
class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
      child: ElevatedButton(
        child: const Text('testing transition'),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookShelf()),
          );
        },
      ),
    ),
      Positioned(
        top: 480,
        left: 99,
        child: Container(
          width: 192,
          height: 63,
          child: ElevatedButton(
            child: const Text("MyHomePage.dart"),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomepage()));
          },
          ),
        ),
      ),
    ]
    );
  }
}
