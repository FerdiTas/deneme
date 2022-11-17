import 'package:flutter/material.dart';
import 'package:search_app/model/pokemon_model.dart';
import 'package:search_app/services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;
  @override
  void initState() {
    _pokemonList = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return Expanded(
            child: ListView.builder(
              itemCount: _listem.length,
              itemBuilder: (context, index) {
                var onakiPokemon = _listem[index];
                return Card(
                  child: ListTile(
                      title: Text(
                        onakiPokemon.id.toString(),
                      ),
                      subtitle: Text(onakiPokemon.name.toString()),
                      trailing: Image.network(onakiPokemon.img.toString())),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("hata cıktı"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
