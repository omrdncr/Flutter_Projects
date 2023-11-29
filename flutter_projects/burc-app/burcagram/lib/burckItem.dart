// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:burcagram/burcDetay.dart';
import 'package:flutter/material.dart';
import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(listelenenBurc.burcAdi,
                        textAlign: TextAlign.center),
                    content: Column(
                      children: [
                        Image.asset("images/" + listelenenBurc.burcKucukResim),
                        Text(listelenenBurc.burcTarihi),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Text(listelenenBurc.burcDetayi)),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      Container(
                        child: ElevatedButton(
                          child: const Text('Tamam'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            onTap: () {
              Navigator.pushNamed(context, '/burcDetay',
                  arguments: listelenenBurc);
            },
            leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.titleLarge,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.titleSmall,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
