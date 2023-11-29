import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  const GridViewOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext cotext, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blueAccent,
                    offset: new Offset(10.0, 5.0),
                    blurRadius: 20.0,
                  )
                ],
                color: Colors.green[100 * ((index + 1) % 8)],
                gradient: LinearGradient(
                    colors: [Colors.teal, Colors.black],
                    begin: Alignment.center,
                    end: Alignment.bottomLeft)),
            margin: EdgeInsets.all(10),
            child: Text(
              "Grid View ${index + 1}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () => debugPrint("Merhaba flutter $index tıklandı..."),
          onDoubleTap: () =>
              debugPrint("Merhaba flutter $index çift tıklandı..."),
          onLongPress: () =>
              debugPrint("Merhaba flutter $index uzun basıldı..."),
          onHorizontalDragStart: (e) => debugPrint(
              "Merhaba flutter $index sağa veya sola kaydırıldı... $e"),
        );
      },
    );
  }
}


/* GridView.extent(
      maxCrossAxisExtent: 200,
      primary: false, //Scroll effect
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade100,
          child: Text(
            "Grid View",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade200,
          child: Text("Grid View", style: TextStyle(fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Grid View", style: TextStyle(fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade400,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade500,
          child: Text(
            "Grid View",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade600,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade700,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade800,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade900,
          child: Text(
            "Grid View",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade900,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade800,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade700,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade600,
          child: Text(
            "Grid View",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade500,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade400,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Grid View",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade200,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade100,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        )
      ],
    ); */


/*     GridView.count(
      crossAxisCount: 2,
      primary: false, //Scroll effect
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade100,
          child: Text(
            "Grid View",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade200,
          child: Text("Grid View", style: TextStyle(fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Grid View", style: TextStyle(fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade400,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade500,
          child: Text(
            "Grid View",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade600,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade700,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade800,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade900,
          child: Text(
            "Grid View",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade900,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade800,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade700,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade600,
          child: Text(
            "Grid View",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade500,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade400,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Grid View",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade200,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade100,
          child: Text("Grid View",
              style: TextStyle(
                fontSize: 20,
              )),
        )
      ],
    ); */