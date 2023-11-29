import 'package:dinamik_ortalama_app/constans/app_constans.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int derssayisi;

  const OrtalamaGoster(
      {required this.derssayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          derssayisi > 0 ? "$derssayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}
