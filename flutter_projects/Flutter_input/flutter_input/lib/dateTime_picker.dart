import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({super.key});

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime ucayoncesi = DateTime(2021, suan.month - 3);
    DateTime yirmigunsonrasi = DateTime(2022, 12, suan.day + 20);
    TimeOfDay suankisaat = TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text("Tarih Seç"),
            color: Colors.green,
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: suan,
                      firstDate: ucayoncesi,
                      lastDate: yirmigunsonrasi)
                  .then((secilentarih) {
                debugPrint(secilentarih.toString());
                debugPrint(secilentarih!.millisecond.toString());
                debugPrint(secilentarih.toIso8601String());
                debugPrint(secilentarih.toUtc().toString());
                debugPrint(secilentarih.add(Duration(days: 20)).toString());
                var yeniDate = DateTime.parse(secilentarih.toUtc().toString());
                debugPrint(yeniDate.toIso8601String());

                print(formatDate(secilentarih, [yyyy, '-', mm, '-', dd]));
                print(formatDate(secilentarih, [dd, '-', mm, '-', yyyy]));
              });
            },
          ),
          MaterialButton(
            child: Text("Saat Seç"),
            color: Colors.blue,
            onPressed: () {
              showTimePicker(context: context, initialTime: suankisaat)
                  .then((secilensaat) {
                debugPrint(secilensaat!.format(context));
                debugPrint(secilensaat.hour.toString() +
                    " : " +
                    secilensaat.minute.toString());
              });
            },
          )
        ],
      )),
    );
  }
}
