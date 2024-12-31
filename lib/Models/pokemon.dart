class Pokemon {
  final String nama;
  final String deskripsi;
  final String type;
  final String image;
  final List<Statistik> statistik; // Ganti kekuatan menjadi statistik
  final List<Evolusi> evolusi;
  final String id;

  Pokemon({
    required this.nama,
    required this.deskripsi,
    required this.type,
    required this.image,
    required this.statistik, // Ganti kekuatan menjadi statistik
    required this.evolusi,
    required this.id,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var statistikList = json['Statistik'] as List;
    List<Statistik> statistik = statistikList.map((i) => Statistik.fromJson(i)).toList();

    var evolusiList = json['Evolusi'] as List;
    List<Evolusi> evolusi = evolusiList.map((i) => Evolusi.fromJson(i)).toList();

    return Pokemon(
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      type: json['type'],
      image: json['image'],
      statistik: statistik, // Sesuaikan dengan nama statistik
      evolusi: evolusi,
      id: json['id'],
    );
  }
}

class Statistik {
  final int hp;
  final int stamina;
  final int ketahanan;
  final int kecepatan;

  Statistik({
    required this.hp,
    required this.stamina,
    required this.ketahanan,
    required this.kecepatan,
  });

  factory Statistik.fromJson(Map<String, dynamic> json) {
    return Statistik(
      hp: json['hp'],
      stamina: json['stamina'],
      ketahanan: json['ketahanan'],
      kecepatan: json['kecepatan'],
    );
  }
}

class Evolusi {
  final String nama;
  final String image;

  Evolusi({
    required this.nama,
    required this.image,
  });

  factory Evolusi.fromJson(Map<String, dynamic> json) {
    return Evolusi(
      nama: json['nama'],
      image: json['image'],
    );
  }
}

// Perubahan pada PokemonList jika data hanya berupa satu list
class PokemonList {
  final List<Pokemon> pokemons; // Hanya satu list Pokémon

  PokemonList({required this.pokemons});

  factory PokemonList.fromJson(List<dynamic> json) {
    List<Pokemon> pokemons = json
        .map((pokemonJson) => Pokemon.fromJson(pokemonJson))
        .toList();

    return PokemonList(pokemons: pokemons);
  }
}
