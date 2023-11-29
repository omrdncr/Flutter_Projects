import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

//sa ben geldim as :)followingdeyim hala öyule
class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});
//şimdi? hala öyle şimdi?
  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

//allah allah önceki bağlantıdakiyle aynı şeyleri yapıyorum proje çalıştığı için bi çalıştırsana hatayı göreyim ben / hala kod yazamıyor musun abi?
class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '', _password2 = '';
  final _formKey = GlobalKey<FormState>();

  bool isEnabled = false;

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text From Field Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  // initialValue: "omer", varsayılan olarak bir değer ile gelir
                  decoration: const InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Username",
                      hintText: "Username"),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (String? deger) {
                    /* if (deger.isEmpty) {
                      return "Please enter a password";
                    } else */
                    if (deger!.isEmpty) {
                      return "Email boş olamaz";
                    } else if (!EmailValidator.validate(deger)) {
                      return "Geçerli e-mail giriniz";
                    }else
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //  initialValue: "omer.dincer@yahoo.com.tr",
                  keyboardType: TextInputType
                      .emailAddress, // email klavyesi çıkar, klavyede @ simgesi belirir

                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "E-Mail",
                      hintText: "E-Mail"),

                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      return 'Lütfen geçerli mail giriniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue: "2023",
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Password",
                      hintText: "Password"),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return 'Şifre en az 4 karakter olmalı';
                    } else {

                      //eğer 4 den büyükse password again enable et
                      /* setState(() {
                        isEnabled = true;
                      }); */
                      if (deger != "2023") {
                        return "Şifre yanlış";
                      }
                      return 'Şifreyi 2. kez girin';

                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // initialValue: "2023",
                  controller: passwordAgainController,
                  enabled: isEnabled,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Password Again",
                      hintText: "Password Again"),
                  onSaved: (deger) {
                    _password2 = deger!;
                  },
                  validator: (deger) {
                    if (deger != "2023") {
                    } else if (deger == "2023") {
                      return null;
                    }
                  }, // şimdi? evet
                ), //niye böyle oluyor ya following ömer dincer yazıpkod yazdırmıyor bana
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          'Username:  $_userName\nEmail:  $_email\nPassword:  $_password\nPassword Again:  $_password2';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                    }
                  },
                  child: const Text("Onayla"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
