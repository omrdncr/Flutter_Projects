import 'package:flutter/material.dart';

class TemelButonlar extends StatelessWidget {
  const TemelButonlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          onLongPress: () {
            debugPrint("Uzun basıldı");
          },
          child: Text("Text Button"),
        ),
        TextButton.icon(
          onPressed: () {},
          onLongPress: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red.shade100),
          ),
          icon: Icon(Icons.add),
          label: Text("Text Button w/icon"),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 15, 127, 255),
              foregroundColor: Color.fromARGB(255, 255, 255, 255)),
          child: Text("Elevated"),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Elevated w/icon"),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.yellow),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text("Out Lined"),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("OutLined w/icon"),
        ),
      ],
    );
  }
}
