import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pages/Pokedex/detail.dart';
import 'package:pokemon/providers/pokemon_provider.dart';
import 'package:pokemon/widgets/colortext.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  String selectedType = 'All';

  // Map background images sesuai tipe
  final Map<String, DecorationImage> typeBackgrounds = {
    'Electric': const DecorationImage(
      image: AssetImage('assets/bcglis.png'),
      fit: BoxFit.cover,
    ),
    'Fire': const DecorationImage(
      image: AssetImage('assets/bacground/bcgapi.png'),
      fit: BoxFit.cover,
    ),
    'Water': const DecorationImage(
      image: AssetImage('assets/water_background.jpg'),
      fit: BoxFit.cover,
    ),
    'Grass': const DecorationImage(
      image: AssetImage('assets/grass_background.jpg'),
      fit: BoxFit.cover,
    ),
  };

  final Map<String, Color> typeColors = {
    'Electric': Colors.yellow,
    'Fire': Colors.red,
    'Water': Colors.blue,
    'Grass': Colors.green,
    'Default': Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    final pokemonAsyncValue = ref.watch(pokemonProvider);

    return Scaffold(
      appBar: AppBar(
  automaticallyImplyLeading: false,
  leading: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 5), // Spasi antara ikon dan teks
        Text(
          'Pokedex',
          style: titletext,
        ),
      ],
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.list, color: Colors.white),
        onSelected: (value) {
          setState(() {
            selectedType = value;
          });
        },
        itemBuilder: (BuildContext context) {
          return const [
            PopupMenuItem(value: 'All', child: Text('All Types')),
            PopupMenuItem(value: 'Electric', child: Text('Electric')),
            PopupMenuItem(value: 'Fire', child: Text('Fire')),
            PopupMenuItem(value: 'Water', child: Text('Water')),
            PopupMenuItem(value: 'Grass', child: Text('Grass')),
          ];
        },
      ),
    ),
  ],
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      color: Color(0xff05121F),
    ),
  ),
),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: pokemonAsyncValue.when(
                data: (pokemons) {
                  final filteredPokemons = pokemons.where((pokemon) {
                    return selectedType == 'All' ||
                        pokemon.type == selectedType;
                  }).toList();

                  if (filteredPokemons.isEmpty) {
                    return const Center(
                      child: Text('No Pokémon found.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemons[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailPage(pokemon: pokemon),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 362,
                              height: 142,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: typeBackgrounds[pokemon.type],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      pokemon.image,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          pokemon.nama,
                                          style: titletext,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: typeColors[pokemon.type],
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Align(
                                              child: Text(
                                            pokemon.type ??
                                                'type tidak ditemukan',
                                            style: textnews,
                                          )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
