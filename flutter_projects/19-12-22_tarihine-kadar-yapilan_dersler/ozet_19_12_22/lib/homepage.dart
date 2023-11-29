import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["Bir", "İki", "Üç", "Dört", "Beş"];
    return Container(
      child: GridView.count(
        crossAxisCount: 10,
        children: items.map((item) => Text(item)).toList(),
        )
      
    );
  }
}