import 'package:diary_chat/screens/bookshelf.dart';
import 'package:flutter/material.dart';
// Don't delete this one yet. I'm testing the transition here...
class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('testing transition'),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookShelf()),
          );
        },
      ),
    );
  }
}
