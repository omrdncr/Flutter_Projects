import 'package:flutter/material.dart';

class OpenaiLogin extends StatefulWidget {
  OpenaiLogin({super.key});

  @override
  State<OpenaiLogin> createState() => _OpenaiLoginState();
}

String _email = '', _password = '', _userName = '', _password2 = '';
final _formKey = GlobalKey<FormState>();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordAgainController = TextEditingController();

class _OpenaiLoginState extends State<OpenaiLogin> {
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
            child: Column(
              children: [
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      passwordController.addListener(() {
                      if (passwordController.text.length > 0) {
                        // password değeri girildiğinde passwordAgain alanı aktif hale getirilir
                       // passwordAgainController.enabled = true;
                      } else {
                        // password değeri boş olduğunda passwordAgain alanı pasif hale getirilir
                       // passwordAgainController.enabled = false;
                      }
                    });
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordAgainController,
                  obscureText: true,
                  enabled: false, // Bu alan pasif olarak başlatılır
                  decoration:
                      const InputDecoration(labelText: 'Password Again'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password again';
                    }
                    return null;
                  },
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
