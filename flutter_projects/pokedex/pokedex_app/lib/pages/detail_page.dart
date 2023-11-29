import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_info.dart';
import 'package:pokedex_app/widgets/ui_helper.dart';
import '../widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImgUrl = 'lib/images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballImgUrl)
        : _buildLandscapeBody(context, pokeballImgUrl);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImgUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFronType(pokemon.type![0]!),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
              iconSize: 18.w,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          PokeTypeName(pokemon: pokemon),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                child: Image.asset(pokeballImgUrl,
                    height: 0.2.sh, fit: BoxFit.fitHeight),
                right: 0,
                top: 0,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.001.sh,
                child: PokeInfo(pokemon: pokemon),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          )),
        ]),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImgUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFronType(pokemon.type![0]!),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeTypeName(pokemon: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(pokeballImgUrl,
                      height: 0.15.sh, fit: BoxFit.fitHeight),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: PokeInfo(pokemon: pokemon),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
