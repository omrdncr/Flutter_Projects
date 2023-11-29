// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransHelper {
  TransHelper._();

  static String getDeviceLanguage(
      BuildContext context, String dynamicText, dynamic dynamicData) {
    var _deviceLanguage = context.deviceLocale.languageCode;

    switch (dynamicText) {
      case "traildays":
        switch (_deviceLanguage) {
          case "tr":
            return "Deneme sürümünün bitmesine $dynamicData gün kaldı.";

          case "en":
            return "$dynamicData days left of the trial version.";

          case "ar":
            return "بقي $dynamicData يوما من النسخة التجريبية";

          default:
            return "$dynamicData days left of the trial version.";
        }

      case "selectplate":
        switch (_deviceLanguage) {
          case "tr":
            return "Seçilen $dynamicData plakasında tanımlı akıllı kartlardan birini seçin";

          case "en":
            return "Select smart card defined on the $dynamicData plate";

          case "ar":
            return "حدد البطاقة الذكية المحددة على اللوحة $dynamicData";

          default:
            return "Select smart card defined on the $dynamicData plate";
        }

      case "cardid":
        switch (_deviceLanguage) {
          case "tr":
            return "KART NO: $dynamicData";

          case "en":
            return "CARD ID: $dynamicData";

          case "ar":
            return "$dynamicData :رقم البطاقة الذكية";

          default:
            return "CARD ID: $dynamicData";
        }

      case "remaining":
        switch (_deviceLanguage) {
          case "tr":
            return " Kart Bakiyesi: $dynamicData Lt";

          case "en":
            return " Remaning Limit: $dynamicData Lt";

          case "ar":
            return "الحد المتبقي: $dynamicData لتر";

          default:
            return " Remaning Limit: $dynamicData Lt";
        }

      case "pumpcount":
        switch (_deviceLanguage) {
          case "tr":
            return "$dynamicData pompada bu ürün mevcut";

          case "en":
            return "$dynamicData pumps have this product";

          case "ar":
            return "مضخة لديها هذا المنتج $dynamicData";

          default:
            return "$dynamicData pumps have this product";
        }

      case "pumpsno":
        switch (_deviceLanguage) {
          case "tr":
            return "Pompa No : $dynamicData";

          case "en":
            return "Pump Number : $dynamicData";

          case "ar":
            return "$dynamicData : رقم المضخات";

          default:
            return "Pump Number : $dynamicData";
        }

      case "x>100":
        switch (_deviceLanguage) {
          case "tr":
            return "Mesafe çok uzak olduğu için işlenemiyor.\nMesafeniz : $dynamicData";

          case "en":
            return "Unable to process because the distance is too far.\nYour Distance : $dynamicData";

          case "ar":
            return "غير قادر على المعالجة لأن المسافة بعيدة جدًا. \n$dynamicData : المسافة الخاصة بك";

          default:
            return "Unable to process because the distance is too far.\ndistance : $dynamicData";
        }

      case "35<x<100":
        switch (_deviceLanguage) {
          case "tr":
            return "İşlem yapabilmek için istasyondan 35 metreden daha yakın olmalısınız.\nMesafeniz : $dynamicData";

          case "en":
            return "You must be less than 35 meters from the station in order to process.\nYour Distance : $dynamicData";

          case "ar":
            return "يجب أن تكون على بعد أقل من 35 مترًا من المحطة حتى تتم المعالجة. \n$dynamicData : المسافة الخاصة بك";

          default:
            return "You must be less than 35 meters from the station in order to process.\nYour Distance : $dynamicData";
        }

      case "x<35":
        switch (_deviceLanguage) {
          case "tr":
            return 'İstasyona 35 metreden daha yakın olduğunuz için artık yakıt ikmali yapabilirsiniz.\nMesafeniz : $dynamicData';

          case "en":
            return 'You can now refuel as you are less than 35 meters from the station.\nYour Distance : $dynamicData';

          case "ar":
            return "يمكنك الآن التزود بالوقود لأنك على بعد أقل من 35 مترًا من المحطة. \n$dynamicData : المسافة الخاصة بك";

          default:
            return 'You can now refuel as you are less than 35 meters from the station.\nYour Distance : $dynamicData';
        }

      default:
        return "";
    }
  }
}
