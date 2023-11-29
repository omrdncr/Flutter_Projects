import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/ui_helper.dart';

class PokeImageBall extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeImageBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImgUrl = 'lib/images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImgUrl,
            color: Colors.grey.shade300,
            width: UIHelper.calculatePokeImgBallSize(),
            height: UIHelper.calculatePokeImgBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImgBallSize(),
              height: UIHelper.calculatePokeImgBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                strokeWidth: 20,
                color: UIHelper.getColorFronType(pokemon.type![0]!),
              ),
            ),
          ),
        )
      ],
    );
  }
}
