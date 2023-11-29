import 'package:flutter/material.dart';
import 'package:marwi_design/components/marwi_graph_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body:  const Center(
            child: MarwiGraphWidget(
          radius: 17,
          titleIcon: Icons.search,
          title: "Azalan Ürünler",
          route: "Detay",
          dividerCut: 30,
          child: Card(
            color: Colors.grey,
            child: Text("asdas"),
          ),
        ),        
        ),
        
      ),
    );
  }
}
