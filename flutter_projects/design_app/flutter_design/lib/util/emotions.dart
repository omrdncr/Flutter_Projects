import 'package:flutter/material.dart';

class EmotionFace extends StatelessWidget {
  final String emotionFace;
  const EmotionFace({Key? key, required this.emotionFace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text(
          emotionFace,
          style: TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
