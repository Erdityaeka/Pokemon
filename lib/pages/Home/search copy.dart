import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/pages/Pokedex/detail.dart';
import 'package:pokemon/providers/pokemon_provider.dart';
import 'package:pokemon/widgets/colortext.dart';

class SearchHome extends ConsumerStatefulWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends ConsumerState<SearchHome> {
  String selectedType = 'All'; // Default type is 'All'
  String searchQuery = ''; // Stores the search query

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
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Text('Search', style: titletext),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.list, color: Colors.white),
              onSelected: (value) {
                setState(() {
                  selectedType = value; // Update selected type
                });
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(value: 'All', child: Text('All')),
                  PopupMenuItem(value: 'Electric', child: Text('Electric')),
                  PopupMenuItem(value: 'Fire', child: Text('Fire')),
                  PopupMenuItem(value: 'Water', child: Text('Water')),
                  PopupMenuItem(value: 'Grass', child: Text('Grass')),
                ];
              },
            ),
          ),
        ],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color(0xff05121F)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              style: textnews,
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search_outlined),
                prefixIconColor: Colors.grey[400],
                filled: true,
                hintText: 'Search',
                suffixStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: pokemonAsyncValue.when(
                data: (pokemons) {
                  List<Pokemon> filteredPokemons = pokemons;

                  // Filter by type if it's not 'All'
                  if (selectedType != 'All') {
                    filteredPokemons = filteredPokemons.where((pokemon) {
                      return pokemon.type == selectedType;
                    }).toList();
                  }

                  // Filter by search query
                  if (searchQuery.isNotEmpty) {
                    filteredPokemons = filteredPokemons.where((pokemon) {
                      return pokemon.nama.toLowerCase().contains(searchQuery);
                    }).toList();
                  }

                  // If no Pokémon found, show "No Results"
                  if (filteredPokemons.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/lottie/not.json', width: 150, height: 150),
                          Text('Tidak Ditemukan', style: texthome),
                        ],
                      ),
                    );
                  }

                  // If the search query is empty and no filter is applied, show the full list
                  if (searchQuery.isEmpty && selectedType == 'All') {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/lottie/loading.json', width: 100, height: 100),
                          Text('Mohon Lakukan Pencarian.', style: texthome),
                        ],
                      ),
                    );
                  }

                  // Display the list of filtered Pokémon
                  return ListView.builder(
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemons[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonDetailPage(pokemon: pokemon),
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
                                image: typeBackgrounds[pokemon.type] ?? typeBackgrounds['Default'],
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
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(pokemon.nama, style: titletext),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: typeColors[pokemon.type] ?? typeColors['Default'],
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: Align(
                                            child: Text(
                                              pokemon.type ?? 'Unknown Type',
                                              style: textnews,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error', style: texthome),
                ),
                loading: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/loading.json', width: 100, height: 100),
                      Text('Loading...', style: texthome),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
