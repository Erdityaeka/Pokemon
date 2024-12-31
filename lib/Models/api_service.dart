// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

// Gantilah URL_API_ANDA dengan URL API yang sesuai
Future<List<Pokemon>> fetchPokemons() async {
  final response = await http.get(Uri.parse('https://673eb14ea9bc276ec4b551ef.mockapi.io/pokedex'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Pokemon.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
