import 'package:flutter/material.dart';

class PageViewOrnek extends StatefulWidget {
  PageViewOrnek(Key k) : super(key: k);

  @override
  State<PageViewOrnek> createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool yatayEksen = true;
  bool pageSnapping = true;
  bool reverseSira = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            scrollDirection:
                yatayEksen == true ? Axis.horizontal : Axis.vertical,
            reverse: reverseSira,
            controller: myController,
            pageSnapping: pageSnapping,
            onPageChanged: (index) {
              debugPrint("page change gelen index: $index");
            },
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.indigo.shade300,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Sayfa 0",
                        style: TextStyle(fontSize: 30),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          myController.jumpToPage(2);
                          //myController.jumpTo(100);
                        },
                        child: Text("ikinci sayfaya git"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.amber.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.purple.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Yatay Eksebde çalış"),
                      Checkbox(
                        value: yatayEksen,
                        onChanged: (b) {
                          setState(() {
                            yatayEksen = b!;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Page snapping"),
                      Checkbox(
                        value: pageSnapping,
                        onChanged: (b) {
                          setState(() {
                            pageSnapping = b!;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Reverse Sıra"),
                      Checkbox(
                        value: reverseSira,
                        onChanged: (b) {
                          setState(() {
                            reverseSira = b!;
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
