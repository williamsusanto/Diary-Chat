import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: <Widget>[
      Column(

        children: [
          Container(
            margin: EdgeInsets.only(top: 150) ,
            width: size.width,
            height: size.height,

            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
            ),
          ),

        ],
      ),
    ],
  );
  }
}

//                  top: 253,
//                   left: 0,
//                   child: Container(
//                       width: 390,
//                       height: 592,
//                       decoration: BoxDecoration(
//                         borderRadius : BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//                           bottomLeft: Radius.circular(0),
//                           bottomRight: Radius.circular(0),