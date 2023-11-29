import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage/models/my_models.dart';
import 'package:flutter_storage/services/file_storage.dart';
import 'package:flutter_storage/services/secure_storage.dart';

class SharedPreferenceKullanimi extends StatefulWidget {
  const SharedPreferenceKullanimi({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceKullanimi> createState() =>
      _SharedPreferenceKullanimiState();
}

class _SharedPreferenceKullanimiState extends State<SharedPreferenceKullanimi> {
  var secilenCinsiyet = Cinsiyet.KADIN;
  var _secilenRenkler = <String>[];
  var _ogrenciMi = false;
  final TextEditingController _nameController = TextEditingController();
  final _preferencesService = FileStorageService();

  @override
  void initState() {
    super.initState();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences / Secure Storage Kullanımı"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Adınızı giriniz"),
            ),
          ),
          for (var item in Cinsiyet.values)
            _buildRadioListTile(describeEnum(item), item),
          for (var item in Renkler.values) _buildCheckboxListTiles(item),
          SwitchListTile(
            title: const Text("Öğrenci Misin ? "),
            value: _ogrenciMi,
            onChanged: (bool ogrenciMi) {
              setState(() {
                _ogrenciMi = ogrenciMi;
              });
            },
          ),
          TextButton(
            onPressed: () {
              var userInfo = UserInfo(_nameController.text, secilenCinsiyet,
                  _secilenRenkler, _ogrenciMi);
              _preferencesService.verileriKaydet(userInfo);
            },
            child: const Text("Kaydet"),
          )
        ],
      ),
    );
  }

  Widget _buildCheckboxListTiles(Renkler renk) {
    return CheckboxListTile(
      title: Text(describeEnum(renk)),
      value: _secilenRenkler.contains(describeEnum(renk)),
      onChanged: (bool? deger) {
        if (deger == false) {
          _secilenRenkler.remove(describeEnum(renk));
        } else {
          _secilenRenkler.add(describeEnum(renk));
        }
        setState(() {
          debugPrint(_secilenRenkler.toString());
        });
      },
    );
  }

  Widget _buildRadioListTile(String title, Cinsiyet cinsiyet) {
    return RadioListTile(
      title: Text(title),
      value: cinsiyet,
      groupValue: secilenCinsiyet,
      onChanged: (Cinsiyet? secilmisCinsiyet) {
        setState(() {
          secilenCinsiyet = secilmisCinsiyet!;
        });
      },
    );
  }

  void _verileriOku() async {
    var info = await _preferencesService.verileriOku();
    _nameController.text = info.isim;
    secilenCinsiyet = info.cinsiyet;
    _secilenRenkler = info.renkler;
    _ogrenciMi = info.ogrenciMi;
    setState(() {});
  }
}
