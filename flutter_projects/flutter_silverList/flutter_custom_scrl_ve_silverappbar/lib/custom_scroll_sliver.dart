import 'dart:math' as matematik;
import 'package:flutter/material.dart';

class CollapsableToolbarOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //backgroundColor: Color.fromARGB(255, 255, 255, 255),
          expandedHeight: 280,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver App Bar"),
            centerTitle: true,
            background: Image.asset(
              "assets/images/liman.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            sabitListeElemanlari(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6)),
        SliverGrid(
            delegate: SliverChildListDelegate(sabitListeElemanlari()),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ],
    );
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 100,
        color: Color.fromARGB(255, 255, 251, 34),
        alignment: Alignment.center,
        child: Text(
          "SliverList 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 47, 255, 109),
        alignment: Alignment.center,
        child: Text(
          "SliverList 2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 49, 155, 255),
        alignment: Alignment.center,
        child: Text(
          "SliverList 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 74, 34, 255),
        alignment: Alignment.center,
        child: Text(
          "SliverList 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 211, 34, 255),
        alignment: Alignment.center,
        child: Text(
          "SliverList 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 255, 51, 51),
        alignment: Alignment.center,
        child: Text(
          "SliverList 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 207, 255, 74),
        alignment: Alignment.center,
        child: Text(
          "SliverList 7",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 52, 143, 79),
        alignment: Alignment.center,
        child: Text(
          "SliverList 8",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Color.fromARGB(255, 202, 202, 202),
        alignment: Alignment.center,
        child: Text(
          "SliverList 9",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text(
        "Sabit Liste Elemanı 1",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }
}
