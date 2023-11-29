import 'package:flutter/material.dart';
import 'package:ozet_19_12_22/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  void _performLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_username == "omer" && _password == "dincer") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        debugPrint("Giriş Başarısız Oldu");
        /*  Scaffold.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Giriş başarısız. Lütfen kullanıcı adı ve şifrenizi kontrol edin.")), */
        //);
      }
    }
  }
void main() => runApp(LoginPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Yap"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen bir kullanıcı adı girin';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen bir şifre girin';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
            MaterialButton(
              onPressed: () => _performLogin(),
              child: Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
