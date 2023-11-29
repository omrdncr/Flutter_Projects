import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  const StepperOrnek({super.key});

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifstep = 0;
  late String isim, mail, sifre;
  late List<Step> tumstepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumstepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Örnek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                MaterialButton(
                  color: Colors.green,
                  onPressed: details.onStepContinue,
                  child: Text("Devam!"),
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  color: Colors.purple,
                  onPressed: details.onStepCancel,
                  child: Text("Geri gel"),
                ),
              ],
            );
          },
          currentStep: _aktifstep,
          steps: tumstepler,
          /* onStepTapped: (tiklanilanstep) {
            setState(() {
              _aktifstep = tiklanilanstep;
            });
          }, */
          onStepContinue: () {
            setState(() {
              ileributonukontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifstep > 0) {
                _aktifstep--;
              } else {
                _aktifstep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
          title: Text("Username başlık"),
          subtitle: Text("Username Alt başlık"),
          state: _stateleriayarla(0),
          isActive: true,
          content: TextFormField(
            key: key0,
            decoration: const InputDecoration(
                labelText: "Username label",
                hintText: "Username hint",
                border: OutlineInputBorder()),
            validator: (girilendeger) {
              if (girilendeger!.length < 6) {
                return "En az 6 karakter giriniz";
              }
            },
            onSaved: (girilendeger) {
              isim = girilendeger!;
            },
          )),
      Step(
          title: Text("E-Mail başlık"),
          subtitle: Text("E-Mail Alt başlık"),
          state: _stateleriayarla(1),
          isActive: true,
          content: TextFormField(
            key: key1,
            decoration: const InputDecoration(
                labelText: "E-Mail label",
                hintText: "E-Mail hint",
                border: OutlineInputBorder()),
            validator: (girilendeger) {
              if (girilendeger!.length < 6 || !girilendeger.contains("@")) {
                return "Geçerli e-mail giriniz";
              }
            },
            onSaved: (girilendeger) {
              mail = girilendeger!;
            },
          )),
      Step(
          title: Text("Password başlık"),
          subtitle: Text("Password Alt başlık"),
          state: _stateleriayarla(2),
          isActive: true,
          content: TextFormField(
            key: key2,
            decoration: const InputDecoration(
                labelText: "Password label",
                hintText: "Password hint",
                border: OutlineInputBorder()),
            validator: (girilendeger) {
              if (girilendeger!.length < 6) {
                return "En az 6 karakter giriniz";
              }
            },
            onSaved: (girilendeger) {
              sifre = girilendeger!;
            },
          )),
    ];
    return stepler;
  }

  StepState _stateleriayarla(int oankistep) {
    if (_aktifstep == oankistep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void ileributonukontrolu() {
    switch (_aktifstep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifstep++;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifstep++;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifstep++;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint("Girilen değerler : isim=>$isim mail=>$mail şifre=>$sifre");
  }
}

/* return Row(
              children: <Widget> [
                MaterialButton(
                  color: Colors.green,
                  onPressed: onStepContiune,
                child: Text("Devam!"),
                ),
                SizedBox(width: 30,),
                MaterialButton(
                color: Colors.purple,
                onPressed: onStepCancel,
                child: Text("Geri gel"),
                ),
              ],
            ); */