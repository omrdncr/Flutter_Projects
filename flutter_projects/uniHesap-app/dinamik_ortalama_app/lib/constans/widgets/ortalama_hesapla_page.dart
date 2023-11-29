import 'package:dinamik_ortalama_app/constans/app_constans.dart';
import 'package:dinamik_ortalama_app/constans/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_app/constans/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_app/constans/widgets/ortalama_goster_widget.dart';
import 'package:dinamik_ortalama_app/helper/data_helper.dart';
import 'package:dinamik_ortalama_app/model/ders.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaMain extends StatefulWidget {
  const OrtalamaHesaplaMain({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaMain> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesaplaMain> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    debugPrint("scaffold build tetiklendi");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    derssayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              )
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Sabitler.yatayPaddingsekiz,
          child: _buildTextFormField(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPaddingsekiz,
                child: HarfDropdownWidget(
                  onHarfSecildi: (harf) {
                    secilenHarfDegeri = harf;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPaddingsekiz,
                child: _buildKrediler(),
              ),
            ),
            IconButton(
              onPressed: _dersEkleveOrtHesapla,
              icon: const Icon(Icons.arrow_forward_ios),
              color: Sabitler.anaRenk,
              iconSize: 30,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        )
      ]),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            debugPrint(deger.toString());
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }

  void _dersEkleveOrtHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
