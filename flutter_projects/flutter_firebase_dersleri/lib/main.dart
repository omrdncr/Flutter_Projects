import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_dersleri/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "FIREBASE"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseAuth auth;
  final String _email = "omer.dincer@yahoo.com.tr";
  final String _password = "password";
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint("User oturumu kapalı!");
      } else {
        debugPrint(
            "User oturum açık! ${user.email} ve email durumu ${user.emailVerified}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIREBASE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                createUserEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Email/Sifre Kayıt"),
            ),
            ElevatedButton(
              onPressed: () {
                loginUserEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text("Email/Sifre Giriş"),
            ),
            ElevatedButton(
              onPressed: () {
                signOutUser();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Oturumu Kapat"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteUser();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black45),
              child: Text("Hesabı Sil"),
            ),
            ElevatedButton(
              onPressed: () {
                changePassword();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text(
                "Şifre Değiştir",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                changeEmail();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text(
                "Email Değiştir",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      var _myUser = _userCredential.user;

      if (!_myUser!.emailVerified) {
        _myUser.sendEmailVerification();
      } else {
        debugPrint("Kullanıcının maili onayanmış, ilgili sayfaya gidebilir.");
      }

      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void loginUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signOutUser() async {
    await auth.signOut();
  }

  void deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
    } else {
      debugPrint("Kullanıcı oturum açmadığı için silinemez");
    }
  }

  void changePassword() async {
    try {
      await auth.currentUser!.updatePassword("password");
      await auth.signOut();
    } on FirebaseException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint("reauthantice olunacak");
        var credential =
            EmailAuthProvider.credential(email: _email, password: _password);
        await auth.currentUser!.reauthenticateWithCredential(credential);

        await auth.currentUser!.updatePassword("password");
        await auth.signOut();
        debugPrint("Şifre güncellendi");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
  void changeEmail() async {
    try {
      await auth.currentUser!.updateEmail("omerdincer@gmail.com");
      await auth.signOut();
    } on FirebaseException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint("reauthantice olunacak");
        var credential =
            EmailAuthProvider.credential(email: _email, password: _password);
        await auth.currentUser!.reauthenticateWithCredential(credential);

        await auth.currentUser!.updateEmail("omerdincer@gmail.com");
        await auth.signOut();
        debugPrint("Email güncellendi");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
