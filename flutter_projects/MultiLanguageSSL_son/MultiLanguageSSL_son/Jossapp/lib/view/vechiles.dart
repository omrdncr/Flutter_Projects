import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'package:jossapp/model/user_response.dart';
import 'package:jossapp/services/all_providers.dart';

// ignore: must_be_immutable
class Vechiles extends ConsumerWidget {
  Vechiles({super.key});

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          backgroundColor: BadColors.stawizDarkGreen,
          textColor: BadColors.stawizWhite,
          msg: "v-toast-doubletap".tr());
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    late final List<Cevap> userInfo =
        (ModalRoute.of(context)!.settings.arguments as List<Cevap>);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Center(
          child: Container(
            color: BadColors.stawizWhite,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Center(
                  child: const Text("v-plate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 15,
                                  color: BadColors.stawizLightGrey,
                                ),
                              ],
                              color: BadColors.stawizGrey))
                      .tr(),
                ),
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: screenHeight * 0.01),
                  child: SvgPicture.asset(
                    "lib/assets/car.svg",
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.12, left: screenWidth * 0.12),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: userInfo[0].vehicles!.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Container(
                              // ignore: sort_child_properties_last
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: BadColors.stawizGrey)),
                                child: Container(
                                  child: ListTile(
                                    onTap: () {
                                      ref
                                          .read(processStateNotifierProvider
                                              .notifier)
                                          .storageUser(userInfo);
                                      List data = List.filled(2, null);
                                      data[0] =
                                          userInfo[0].vehicles![index].cards;
                                      data[1] =
                                          userInfo[0].vehicles![index].plate;
                                      // debugPrint("Data 0 --------------" +
                                      //     data[0].toString());
                                      // debugPrint("Data 1 --------------" +
                                      //     data[1].toString());
                                      //debugPrint(
                                      //  "${userInfo[0].vehicles![index].plate} plakasına basıldı");
                                      ref
                                          .read(presetStateNotifierProvider
                                              .notifier)
                                          .aracDoldur(
                                              customplate: userInfo[0]
                                                  .vehicles![index]
                                                  .plate);

                                      debugPrint(ref
                                          .watch(presetStateNotifierProvider)
                                          .toString());

                                      Navigator.pushNamed(context, '/rfcard',
                                          arguments: data);
                                    },
                                    title: Center(
                                      child: Text(
                                        userInfo[0]
                                            .vehicles![index]
                                            .plate
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: BadColors.stawizGrey,
                                border: Border.all(
                                    color: BadColors.stawizGrey, width: 2),
                                borderRadius: BorderRadius.circular(5),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    //<-- SEE HERE
                                    color: BadColors.stawizGrey,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: screenWidth * 0.05,
                                  left: screenWidth * 0.05),
                              child: Divider(
                                color: BadColors.stawizDarkGreen,
                                thickness: screenHeight * 0.004,
                                height: 20,
                              ),
                            ),
                          ],
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
