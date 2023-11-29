import 'package:flutter/material.dart';

class KisiselFont extends StatelessWidget {
  const KisiselFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Center(
          child: Text(
            "Kişisel Font Kullanımı",
            style: TextStyle(fontFamily: 'textStyle1', fontSize: 36),
          ),
        ),
      ],
    );
  }
}
