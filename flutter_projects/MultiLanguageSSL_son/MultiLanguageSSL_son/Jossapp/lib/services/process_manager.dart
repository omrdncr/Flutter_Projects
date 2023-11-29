// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jossapp/model/process_model.dart';
import '../model/user_response.dart';

class ProcessManager extends StateNotifier<ProcessModel> {
  ProcessManager()
      : super(ProcessModel(
          timerCounter: 0,
          saleStateStatus: 0.0,
          userInfo: [],
          // animWidget: const AutoSizeText(
          //   "Sales Process Continues...",
          //   style: TextStyle(fontSize: 15),
          // ),
          // animAlign: Alignment.center,
          // animCol: Colors.white,
          // animHeight: 300,
          // animWidth: 300
        ));

  //void setupTimer() {}

  // void animChange(Color? myanimCol, Widget? myanimWidget, double? myanimHeight,
  //     double? myanimWidth, AlignmentGeometry? myanimAlign) {
  //   state = ProcessModel(
  //     timerCounter: state.timerCounter,
  //     saleStateStatus: state.saleStateStatus,
  //     // animWidget: myanimWidget == null ? state.animWidget : myanimWidget,
  //     // animAlign: myanimAlign == null ? state.animAlign : myanimAlign,
  //     // animHeight: myanimHeight == null ? state.animHeight : myanimHeight,
  //     // animWidth: myanimWidth == null ? state.animWidth : myanimWidth,
  //     // animCol: myanimCol == null ? state.animCol : myanimCol,
  //   );
  // }

  // void counterIncrease(double screenHeight, double screenWidth) {
  //   debugPrint(state.timerCounter.toString());
  //   state = ProcessModel(
  //     timerCounter: state.timerCounter + 1,
  //     animWidget: state.animWidget,
  //     animAlign: state.animAlign,
  //     animHeight: state.animHeight,
  //     animWidth: state.animWidth,
  //     animCol: state.animCol,
  //     saleStateStatus: state.saleStateStatus,
  //   );
  //   if (state.timerCounter % 3 == 0) {
  //     animChange(
  //         Colors.amber,
  //         const AutoSizeText(
  //           "Sales Process Continues...",
  //           style: TextStyle(fontSize: 30),
  //         ),
  //         screenHeight * 0.9,
  //         screenWidth * 0.7,
  //         Alignment.bottomCenter);
  //   } else if (state.timerCounter % 3 == 1) {
  //     animChange(
  //         Colors.blue,
  //         const AutoSizeText(
  //           " Please Take The Fuel Nozzle And Start Loading..",
  //           style: TextStyle(
  //               fontSize: 25,
  //               fontWeight: FontWeight.bold,
  //               color: Color.fromARGB(255, 154, 118, 9)),
  //           maxLines: 3,
  //         ),
  //         screenHeight * 0.6,
  //         screenWidth * 0.9,
  //         Alignment.center);
  //   } else if (state.timerCounter % 3 == 2) {
  //     animChange(
  //         Color.fromARGB(255, 81, 73, 73),
  //         const AutoSizeText(
  //           "Please, note that if you do not start processing within 60 Seconds, it will be cancelled.",
  //           style: TextStyle(fontSize: 20, color: Colors.white),
  //           maxLines: 3,
  //         ),
  //         screenHeight * 0.9,
  //         screenWidth * 0.6,
  //         Alignment.topCenter);
  //   }
  // }

  // void counterZero() {
  //   state = ProcessModel(
  //       timerCounter: 0,
  //       animWidget: state.animWidget,
  //       animAlign: state.animAlign,
  //       animHeight: state.animHeight,
  //       animWidth: state.animWidth,
  //       animCol: state.animCol,
  //       saleStateStatus: state.saleStateStatus);
  // }
  void storageUser(List<Cevap> customUserInfo) {
    state = ProcessModel(
        saleStateStatus: state.saleStateStatus,
        timerCounter: state.timerCounter,
        userInfo: customUserInfo != null
            ? state.userInfo = customUserInfo
            : state.userInfo = state.userInfo);
  }

  void changeSaleStatus(double customsaleStateStatus) {
    state = ProcessModel(
        timerCounter: 0,
        saleStateStatus: customsaleStateStatus != null
            ? customsaleStateStatus
            : state.saleStateStatus
        // animWidget: state.animWidget,
        // animAlign: state.animAlign,
        // animHeight: state.animHeight,
        // animWidth: state.animWidth,
        // animCol: state.animCol,
        );
  }

  void showLoaderDialog(BuildContext context, String loadingMessages) {
    AlertDialog alert = AlertDialog(
      content: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(loadingMessages)),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
