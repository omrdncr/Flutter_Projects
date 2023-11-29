import 'package:flutter/material.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({Key? key}) : super(key: key);
  final sayacWidgetKey = GlobalKey<_SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma miktarı: "),
            SayacWidget(
              key: sayacWidgetKey,
            ),
            Text(sayacWidgetKey.currentState?._sayac.toString() ?? "0"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  const SayacWidget({Key? key}) : super(key: key);

  @override
  _SayacWidgetState createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("2");
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
