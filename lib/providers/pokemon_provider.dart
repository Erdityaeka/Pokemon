// pokemon_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/Models/api_service.dart';
import 'package:pokemon/Models/pokemon.dart';


// Membuat provider untuk mengambil daftar Pokemon
final pokemonProvider = FutureProvider<List<Pokemon>>((ref) async {
  return await fetchPokemons();
});
