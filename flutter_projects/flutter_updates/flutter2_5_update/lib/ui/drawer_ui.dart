import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ömer Dinçer"),
            accountEmail: Text("omer.dincer@yahoo.com.tr"),
            currentAccountPicture: Image.network(
                'https://i0.wp.com/www.mepsan.com.tr/wp-content/uploads/2018/12/mepsan-logo.png?ssl=1',
                color: Colors.black),
            otherAccountsPictures: const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("TC"),
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("ÖD"),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Anasayfa"),
                  trailing: Icon(Icons.arrow_right_alt),
                ),
                const ListTile(
                  leading: Icon(Icons.call),
                  title: Text("İletişim"),
                  trailing: Icon(Icons.arrow_right_alt),
                ),
                const ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Profil"),
                  trailing: Icon(Icons.arrow_right_alt),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.purple,
                  child: const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
                const AboutListTile(
                  applicationName: "Flutter Test About",
                  applicationIcon: Icon(Icons.question_mark),
                  applicationVersion: "2.0",
                  applicationLegalese: null,
                  icon: Icon(Icons.lightbulb),
                  aboutBoxChildren: <Widget>[
                    Text("Flutter Version: 2.5"),
                    Text("Dart Version: 4.7"),
                    Text("Android Support 12.0"),
                  ],
                  child: Text("Hakkında"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
