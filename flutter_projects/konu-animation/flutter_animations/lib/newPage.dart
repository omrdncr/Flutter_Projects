import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Hero(
            tag: "omer",
            child: FlutterLogo(
            size: 256,
          style: FlutterLogoStyle.markOnly,
          ),
          )
        ],
        ),
      ),
    );
  }
}