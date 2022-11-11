import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diary_chat/screens/bookshelf_body.dart';
import 'package:diary_chat/screens/bookshelf_bottom.dart';


class BookShelf extends StatefulWidget {
  @override
  _BookShelfState createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(138, 136, 209, 1),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
       appBar: AppBar(
         elevation: 0,
         leading:
           IconButton(
             onPressed: () {},
             icon: SvgPicture.asset("assets/icons/back_icon.svg"),
             iconSize: 10,
           ),

         title: Text('Back'),
         backgroundColor: Color.fromRGBO(138, 136, 209, 1),
         ),
        body: SingleChildScrollView(
          child: Body(),
        ),
        bottomNavigationBar: SingleChildScrollView(
          child: Bottom(),
        ),
      ),
    );


    return Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              ElevatedButton(
                child: const Text('go back'),
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 754,
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0,4),
                            blurRadius: 6
                        )],
                        color : Color.fromRGBO(138, 136, 209, 1),
                      )
                  )
              ),Positioned(
                  top: 71,
                  left: 63,
                  child: Text('Back', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 128,
                  left: 42,
                  child: Text('Your Book Shelf ', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 0.7142857142857143
                  ),)
              ),Positioned(
                  top: 253,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 592,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        color : Color.fromRGBO(255, 255, 255, 1),
                      )
                  )
              ),Positioned(
                  top: 19,
                  left: 288,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 18,
                  left: 315,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 18,
                  left: 339,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 18,
                  left: 43,
                  child: Text('11:53', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 69,
                  left: 28,
                  child: Container(
                      width: 27,
                      height: 23,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset('assets/images/diary_logo_gray')
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 754,
                  left: 0,
                  child: Container(
                      width: 390,
                      height: 91,
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0,0),
                            blurRadius: 10
                        )],
                        color : Color.fromRGBO(183, 181, 241, 0.029999999329447746),
                      )
                  )
              ),Positioned(
                  top: 722,
                  left: 162,
                  child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0,4),
                            blurRadius: 4
                        )],
                        color : Color.fromRGBO(138, 136, 209, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(65, 65)),
                      )
                  )
              ),Positioned(
                  top: 736,
                  left: 182,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 213,
                  left: 42,
                  child: Container(
                      width: 309,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color : Color.fromRGBO(255, 255, 255, 1),
                      )
                  )
              ),Positioned(
                  top: 182,
                  left: 69,
                  child: Text('Search for years or keywords', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(168, 168, 168, 1),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.4166666666666667
                  ),)
              ),Positioned(
                  top: 234,
                  left: 40,
                  child: Container(
                      width: 97,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color : Color.fromRGBO(236, 168, 129, 1),
                      )
                  )
              ),Positioned(
                  top: 245,
                  left: 69,
                  child: Text('All', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 0.7692307692307693
                  ),)
              ),Positioned(
                  top: 694,
                  left: 171,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 763,
                  left: 55,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 760,
                  left: 264,
                  child: Image.asset('assets/images/diary_logo_gray')
              ),Positioned(
                  top: 293,
                  left: 24,
                  child: Container(
                      width: 517,
                      height: 384,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/Image2.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),Positioned(
                  top: 301,
                  left: 39,
                  child: Container(
                      width: 214,
                      height: 376,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 0),
                      )
                  )
              ),
            ]
        )
    );
  }
}
        