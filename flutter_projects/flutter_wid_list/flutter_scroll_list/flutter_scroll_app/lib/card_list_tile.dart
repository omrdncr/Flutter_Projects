import 'package:flutter/material.dart';

class CardListTileKullanimi extends StatelessWidget {
  const CardListTileKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Ve List Tile"),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani()
              ],
            ),
            Text("Hİİİ"),
            ElevatedButton(onPressed: () {}, child: Text("Buton"))
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildKullan() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani()
        ],
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
          color: Colors.blueAccent.shade100,
          shadowColor: Color.fromARGB(255, 136, 255, 0),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            title: Text("Başlık"),
            subtitle: Text("Alt Başlık"),
            trailing: Icon(Icons.add_a_photo),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 0, 0, 0),
          thickness: 1,
          height: 1,
          indent: 70,
          endIndent: 70,
        )
      ],
    );
  }
}
