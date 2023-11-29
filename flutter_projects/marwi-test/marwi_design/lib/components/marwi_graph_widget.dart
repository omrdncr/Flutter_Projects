import 'package:flutter/material.dart';

class MarwiGraphWidget extends StatelessWidget {
  final double? padding;
  final Widget child;
  final double radius;
  final String? route;
  final Color? color;
  final IconData titleIcon;
  final String title;
  final double? dividerCut;
  final double iconSize;

  const MarwiGraphWidget(
      {super.key,
      required this.child,
      required this.radius,
      this.route,
      this.color = Colors.red,
      required this.titleIcon,
      required this.title,
      this.dividerCut = 0,
      this.iconSize = 25,
      this.padding = 8});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (route != null) {
      return Padding(
        padding: EdgeInsets.all(padding!),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: dividerCut!),
                    child: Icon(
                      titleIcon,
                      size: iconSize,
                      color: color,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: dividerCut! + iconSize),
                      child: Center(child: Text(title)),
                    ),
                  ),
                ],
              ),
              Divider(
                color: color,
                thickness: 1,
                endIndent: dividerCut,
                indent: dividerCut,
              ),
              Container(
                child: child,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(route!),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(padding!),
        child: Container(
          padding: EdgeInsets.all(padding!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                      flex: 50,
                      child: Icon(
                        titleIcon,
                        color: color,
                      )),
                  Expanded(flex: 100, child: Text(title)),
                ],
              ),
              Divider(
                color: color,
                thickness: 3,
                endIndent: dividerCut,
                indent: dividerCut,
              ),
              Container(
                child: child,
              )
            ],
          ),
        ),
      );
    }
  }
}
