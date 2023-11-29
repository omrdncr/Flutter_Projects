import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_card_scanner_latest/flutter_card_scanner_latest.dart';
import 'example/cardscanner_responsive.dart';
import 'example/constant.dart';
/*Example class which demonstrates
the use of the plugin*/

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cardScanResponse = '';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCardScan() async {
    String scanResponse='';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String response = await FlutterCardScannerLatest.scanCard;
      //Parsing the response
      final CardScanResponse cardScanResponse =
      CardScanResponse.fromJSON(json.decode(response));
      //Reading the response and rendering it on the screen
      if (cardScanResponse.result == Constant.success) {
        scanResponse = '${cardScanResponse.responseText}\nCardholder\'s Name : ${cardScanResponse.body.cardholderName}\nExpiry : ${cardScanResponse.body.expiry}';
      } else {
        scanResponse = cardScanResponse.responseText;
      }
    } on PlatformException catch (e) {
      scanResponse = "Failed to scan the card ::: '${e.message}'.";
    }

    setState(() {
      cardScanResponse = scanResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Card Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: cardScanResponse,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: initCardScan,
        tooltip: 'Scan Card',
        elevation: 50.0,
        child: const Icon(Icons.scanner),
      ),
    ),
    );
  }
}