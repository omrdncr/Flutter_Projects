import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
    debugPrint("Init state çalıştı");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        appBarRenginiBul()); // ilk buil çalışmıştır, bu bitmiştir, bu bittikten sonra işlemlerinizi yapıp setstate diyerek buildi bir daha çalıştırmış oluyoruz

    // _generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build çalıştı");
    return Scaffold(
        primary: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: appBarRengi,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.secilenBurc.burcAdi + " Burcu ve Özellikleri",
                ),
                centerTitle: true,
                background: Image.asset(
                  // ignore: prefer_interpolation_to_compose_strings
                  'images/' + widget.secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(14),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            )),
          ],
        ));
  }

  void appBarRenginiBul() async {
    debugPrint("Build bitti baskın renk bulunacak");
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
    appBarRengi = _generator.vibrantColor!.color;
    debugPrint("Baskın renk bulundu, build metotu tekrar çalıştırılacak");
    setState(() {});
    debugPrint(appBarRengi.toString());
  }
}
