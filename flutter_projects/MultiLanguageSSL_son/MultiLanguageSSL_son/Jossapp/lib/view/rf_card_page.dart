// ignore_for_file: sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'package:jossapp/model/user_response.dart';
import 'package:jossapp/services/all_providers.dart';
import 'package:jossapp/util/helpers/trans_helper.dart';

class RfCardView extends StatefulWidget {
  const RfCardView({super.key});

  @override
  State<RfCardView> createState() => _RfCardViewState();
}

class _RfCardViewState extends State<RfCardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late final List<dynamic> data =
        (ModalRoute.of(context)!.settings.arguments as List<dynamic>);
    late final List<RfCard> rfCards = data[0] as List<RfCard>;

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: BadColors.stawizWhite,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: screenHeight * 0.09,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Center(
                  child: AutoSizeText(
                      TransHelper.getDeviceLanguage(
                          context, "selectplate", data[1]),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 20,
                              color: BadColors.stawizLightGrey,
                            ),
                          ],
                          color: BadColors.stawizGrey)),
                ),
              ),
            ),
            Expanded(
              flex: 25,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                //scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: rfCards.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.only(
                        right: screenWidth / 15,
                        left: screenWidth / 15,
                        bottom: screenHeight / 30),
                    height: screenWidth / 2,
                    width: double.infinity,
                    child: CustomFlipCard(
                        rfCards, index, screenHeight, screenWidth),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  FlipCard CustomFlipCard(List<RfCard> rfCards, int index, double screenHeight,
      double screenWidth) {
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: FlipCardFrontEnd(rfCards, index, screenHeight, screenWidth),
      back: FlipCardBackEnd(
          context: context,
          rfCards: rfCards,
          index: index,
          screenHeight: screenHeight,
          screenWidth: screenWidth),
    );
  }

  /////////////////////////////////////----FLİP CARD FRONT END----////////////////////////////////////////
  // ignore: non_constant_identifier_names
  Widget FlipCardFrontEnd(List<RfCard> rfCards, int index, double screenHeight,
      double screenWidth) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: BadColors.stawizDarkWhite,
          border: Border.all(color: BadColors.stawizGrey),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: BadColors.stawizGrey,
              blurRadius: 10,
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: screenHeight * 0.040,
                width: screenWidth * 0.20,
                decoration: const BoxDecoration(
                  //color: Colors.deepPurple,
                  image: DecorationImage(
                      image: ExactAssetImage("lib/assets/jordanpet.png"),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 40,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "r-smrt-card",
                            style: TextStyle(
                              color: BadColors.stawizWhite,
                              fontSize: screenHeight * 0.013,
                            ),
                          ).tr()),
                      height: screenHeight * 0.018,
                      color: BadColors.stawizRed,
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "Fill..Control..Save\nملء .. التحكم .. حفظ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: screenHeight * 0.018),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: screenHeight * 0.018,
                      color: BadColors.stawizRed,
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.only(right: screenWidth * 0.03),
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  "JOCARD",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.032,
                      color: BadColors.joPetGreen),
                ),
              )),
          Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.only(
                    bottom: screenWidth * 0.02, left: screenWidth * 0.03),
                alignment: Alignment.bottomLeft,
                child: AutoSizeText(
                  TransHelper.getDeviceLanguage(
                      context, "cardid", rfCards[index].rfno),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class FlipCardBackEnd extends ConsumerWidget {
  const FlipCardBackEnd({
    Key? key,
    required this.context,
    required this.rfCards,
    required this.index,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final BuildContext context;
  final List<RfCard> rfCards;
  final int index;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: BadColors.stawizDarkWhite,
          border: Border.all(
            color: BadColors.stawizGrey,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: BadColors.stawizGrey,
              blurRadius: 10,
            )
          ]),
      child: Column(
        children: [
          Expanded(
              flex: 35,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: BadColors.stawizBlack,
                ),
              )),
          Expanded(
            flex: 5,
            child: Container(),
          ),
          Expanded(
              flex: 7,
              child: SizedBox(
                height: screenHeight * 0.018,
                child: Container(color: BadColors.stawizRed),
              )),
          Expanded(
            flex: 25,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: AutoSizeText(
                TransHelper.getDeviceLanguage(
                    context,
                    "remaining",
                    (rfCards[index].remaininglimit)!.substring(
                        0, (rfCards[index].remaininglimit)!.length - 2)),
                style: TextStyle(
                    color: BadColors.stawizBlack,
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 30,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(bottom: 8.0, right: 10),
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(presetStateNotifierProvider.notifier).aracDoldur(
                        customrfno: rfCards[index].rfno,
                        customcardlimit:
                            double.parse(rfCards[index].remaininglimit!));

                    //tostring methodunu model sınıfında override ettim.
                    debugPrint(
                        ref.watch(presetStateNotifierProvider).toString());
                    Navigator.pushNamed(context, '/homepage',
                        arguments: rfCards[index].rfno);
                  },
                  child: AutoSizeText(
                    "r-slct-card".tr(),
                    style: TextStyle(
                        color: BadColors.stawizBlack,
                        fontSize: screenWidth * 0.045),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
