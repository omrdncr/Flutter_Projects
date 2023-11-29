import 'package:flutter/material.dart';

class ListviewLayoutProblemleri extends StatelessWidget {
  const ListviewLayoutProblemleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Layout Problems"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Başladı"),
            Expanded(
              child: ListView(
                shrinkWrap:
                    true, // sadece elemanlar kadar yer kapla, false ise parent kadar yer kaplar yani Container kadar yer kaplar
                children: [
                  Container(
                    height: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    height: 200,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            Text("Bitti")
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.red),
        ),
      ),
    );
  }
}
