import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'components/custom_carousel_slider.dart';
import 'components/custom_clipper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    late final String? rfno =
        (ModalRoute.of(context)!.settings.arguments as String?);

    return Scaffold(
      body: Container(
        color: BadColors.stawizWhite,
        child: Column(
          children: [
            Stack(children: [
              ClipPath(
                //en üst kısımdaki appbar kesim yapılan yer
                clipper: MyCustomClipper(),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: (screenHeight * 0.17) / 3.5,
                        left: (screenHeight * 0.17) / 5),
                    child: Text(
                      "JossApp",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  color: BadColors.stawizGreen, //
                  width: double.infinity,
                  height: screenHeight * 0.17,
                ),
              ),
              Positioned(
                //appbar kısmındaki gif
                top: (screenHeight * 0.17) - (screenHeight * 0.085),
                left: screenWidth - (screenHeight * 0.10),
                // screenWidth -
                //     ((screenWidth / 39.272) + (screenWidth * 0.35))
                width: screenHeight * 0.085,
                height: screenHeight * 0.085,
                child: GifView.asset(
                  'lib/assets/destination.gif',
                  height: screenHeight * 0.085,
                ),
              ),
            ]),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Expanded(
              child: MyCostumCarousel(
                rfno: rfno!,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//otomatik arka planda konum hesaplama yapılacak unutma
// class MyDistance extends ConsumerWidget {
//   const MyDistance({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//         color: BadColors.stawizWhite,
//         child: const Text(
//           "Select Station",
//           style: TextStyle(
//               color: BadColors.stawizGreen,
//               fontSize: 20,
//               fontWeight: FontWeight.bold),
//         ));
//   }
// }
