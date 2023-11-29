import 'package:flutter/material.dart';

class DerslerTile extends StatelessWidget {
  final icon;
  final String dersAdi;
  final int dersNum;
  final color;

  const DerslerTile(
      {Key? key,
      required this.icon,
      required this.dersAdi,
      required this.dersNum,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        color: color,
                        child: Icon(
                          icon,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dersAdi,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("$dersNum Ders",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          )),
    );
  }
}
