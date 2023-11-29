import 'package:flutter/material.dart';
import 'package:flutter_input/dateTime_picker.dart';
import 'package:flutter_input/digerForm_elemanlari.dart';
import 'package:flutter_input/globalkey_kullanimi.dart';
import 'package:flutter_input/stepper_kullanimi.dart';
/* import 'package:flutter_input/textFromFiel_kullanimi.dart';
import 'openai_login.dart'; */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: StepperOrnek());
  }
}

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "omer.dincer@yahoo.com.tr");
    _focusNode = FocusNode();
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {}
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLength: 30,
              onChanged: (String deger) {
                if (deger.length > 3) {
                  setState(() {
                    _emailController.value = TextEditingValue(
                        text: deger,
                        selection:
                            TextSelection.collapsed(offset: deger.length));
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı / E-Mail",
                hintText: "Kullanıcı Adı veya E-Posta Giriniz",
                //icon: Icon(Icons.verified_user_rounded),
                prefixIcon: Icon(Icons.email),

                //suffixIcon:Icon(Icons.check), // KULLANICI ADI DĞRU İSE ÇALIŞTIR !!!
                filled: true,
                //fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onSubmitted: (String deger) {
                print("submit" + deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = "omer.dincer@yahoo.com.tr";
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
