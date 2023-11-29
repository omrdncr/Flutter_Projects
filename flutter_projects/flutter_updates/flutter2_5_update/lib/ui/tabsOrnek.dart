import 'package:flutter/material.dart';

class TabsOrnek extends StatefulWidget {
  const TabsOrnek({super.key});

  @override
  State<TabsOrnek> createState() => _TabsState();
}

class _TabsState extends State<TabsOrnek> with SingleTickerProviderStateMixin {
  TabController? tabControllerim;
  @override
  void initState() {
    super.initState();
    tabControllerim = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab kullanımı"),
        bottom: tabBarim(),
      ),
      bottomNavigationBar: tabBarimBottom(),
      body: TabBarView(
        controller: tabControllerim,
        children: [
          Container(
            color: Colors.blueAccent,
            child: const Center(
                child: Text(
              "Tab 1",
              style: TextStyle(fontSize: 48),
            )),
          ),
          Container(
            color: Colors.redAccent,
            child: const Center(
                child: Text(
              "Tab 2",
              style: TextStyle(fontSize: 48),
            )),
          ),
          Container(
            color: Colors.greenAccent,
            child: const Center(
                child: Text(
              "Tab 3",
              style: TextStyle(fontSize: 48),
            )),
          ),
        ],
      ),
    );
  }

  TabBar tabBarim() {
    return TabBar(controller: tabControllerim, tabs: const <Widget>[
      Tab(
        icon: Icon(Icons.keyboard),
        text: "Tab 1",
      ),
      Tab(
        icon: Icon(Icons.lock),
        text: "Tab 2",
      ),
      Tab(
        icon: Icon(Icons.shuffle),
        text: "Tab 3",
      ),
    ]);
  }

  Widget tabBarimBottom() {
    return Container(
      color: Colors.tealAccent,
      child: TabBar(controller: tabControllerim, tabs: const <Widget>[
        Tab(
          icon: Icon(Icons.keyboard),
          text: "Tab 1",
        ),
        Tab(
          icon: Icon(Icons.lock),
          text: "Tab 2",
        ),
        Tab(
          icon: Icon(Icons.shuffle),
          text: "Tab 3",
        ),
      ]),
    );
  }
}
