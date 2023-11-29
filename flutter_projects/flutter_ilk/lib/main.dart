import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Container containerOlustur(String harf, Color renk) {
    return Container(
      width: 75,
      height: 75,
      alignment: Alignment.center,
      color: renk,
      child: Text(
        harf,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
/*   String _img1 =
      "https://cdn.britannica.com/92/152292-060-EAF28A45/Bald-eagle.jpg";
  String _img3 =
      "https://jocard.jppmc.jo/customer/javax.faces.resource/images/stawiz_logo.png.xhtml?ln=sentinel-layout"; */
  //String _local ="C:\Users\omer.dincer\Desktop\stawiz_logo.png"

  String _img2 =
      "https://i1.wp.com/www.mepsan.com.tr/wp-content/uploads/2018/01/logo.png?fit=209%2C90&ssl=1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple)),
      home: myScaffold(),
    );
  }
}

class myScaffold extends StatelessWidget {
  Row dartRowunuOlustur() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          color: Colors.amber[100],
          child: Text(
            "D",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          color: Colors.amber[200],
          child: Text(
            "A",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          color: Colors.amber[300],
          child: Text(
            "R",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          color: Colors.amber[600],
          child: Text(
            "T",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }

  Column dersleriColumnuOlustur() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[200],
            child: Text(
              "E",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          margin: EdgeInsets.only(top: 5),
          color: Colors.amber[300],
          child: Text(
            "R",
            style: TextStyle(fontSize: 30),
          ),
        )),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[600],
            child: Text(
              "S",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[600],
            child: Text(
              "L",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[600],
            child: Text(
              "E",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[700],
            child: Text(
              "R",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: 5),
            color: Colors.amber[800],
            child: Text(
              "İ",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }

  myScaffold({super.key});

/*   final String _img2 =
      "https://jocard.jppmc.jo/customer/javax.faces.resource/images/stawiz_logo.png.xhtml?ln=sentinel-layout"; */

  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width;
    debugPrint(myWidth.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
              width: 60,
              height: 60,
              child: RiveAnimation.asset(
                  'lib/assets/animation/breathing_stawiz.riv')),
          //APP BAR RIVE ANIMATION
          Container(
            width: myWidth - 60,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                "lib/assets/image/stawiz_logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: /*Container(
           height: 1000,
        width: 1000,
        child: RiveAnimation.asset('lib/assets/animation/breathing_stawiz.riv'), */ // RIVE ANIMATION

          Container(
        color: Color.fromARGB(255, 104, 225, 255),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          dartRowunuOlustur(),
          Expanded(child: dersleriColumnuOlustur()),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*color:
          Color.fromARGB(255, 255, 0, 0);*/
          debugPrint("TIKLANDI");
        },
        child: Icon(
          Icons.account_circle_rounded,
          color: Colors.black,
          size: 55,
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }

  List<Widget> get sorunluContainer {
    return [
      Container(
        width: 60,
        height: 60,
        color: Color.fromARGB(255, 49, 0, 105),
      ),
      Container(
        width: 60,
        height: 60,
        color: Colors.blue,
      ),
      Container(
        width: 60,
        height: 60,
        color: Colors.yellow,
      ),
      Container(
        width: 60,
        height: 60,
        color: Colors.green,
      ),
      Container(
        width: 60,
        height: 60,
        color: Colors.amber,
      ),
      Container(
        width: 60,
        height: 60,
        color: Color.fromARGB(255, 255, 0, 234),
      ),
    ];
  }

  List<Widget> get flexibleContainer {
    return [
      Flexible(
        flex: 1,
        child: Container(
          width: 100,
          height: 300,
          color: Color.fromARGB(255, 49, 0, 105),
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 100,
          height: 300,
          color: Colors.blue,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 100,
          height: 300,
          color: Color.fromARGB(255, 51, 243, 33),
        ),
      ),
      Flexible(
        child: Container(
          width: 100,
          height: 300,
          color: Color.fromARGB(255, 255, 0, 0),
        ),
      ),
    ];
  }

  List<Widget> get expendedContainer {
    return [
      Expanded(
        flex: 2,
        child: Container(
          width: 60,
          height: 60,
          color: Color.fromARGB(255, 49, 0, 105),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.blue,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.green,
        ),
      ),
    ];
  }

  Widget Container_dersleri() {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.rectangle,
              border: Border.all(width: 4, color: Colors.deepPurple),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              /*  image: DecorationImage(
                  image: Image.file("lib/assets/image/mepsan.png",
                  fit: BoxFit.scaleDown,
                  repeat: ImageRepeat.repeat), */
              boxShadow: [
                BoxShadow(
                    color: Colors.green,
                    offset: Offset(10, 20),
                    blurRadius: 10),
                BoxShadow(
                    color: Colors.yellow,
                    offset: Offset(5, 10),
                    blurRadius: 10),
              ]),
          child: Text(
            "STAWİZ",
            style: TextStyle(
              fontSize: 80,
              color: Colors.blue[700],
            ),
          )),
    );
  }

/* Column 
Container(
              width: 60,
              height: 60,
              color: Colors.amber[200],
              child: Text(
                "E",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[300],
              child: Text(
                "R",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[600],
              child: Text(
                "S",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[600],
              child: Text(
                "L",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[600],
              child: Text(
                "E",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[700],
              child: Text(
                "R",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[800],
              child: Text(
                "İ",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ), */

/* Row 
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[100],
              child: Text(
                "D",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[200],
              child: Text(
                "A",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
              width: 60,
              height: 60,
              color: Colors.amber[300],
              child: Text(
                "R",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.amber[600],
              child: Text(
                "T",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ) */

}
