import 'package:flutter/material.dart';
import 'package:pokemon/Models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Tentukan background berdasarkan type
  final Map<String, Color> typeColors = {
    'Electric': Colors.yellow,
    'Fire': Colors.red,
    'Water': Colors.blue,
    'Grass': Colors.green,
    'Default': Colors.grey, // Default jika tipe tidak ditemukan
  };

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nama),
      ),
      body: Container(
        color: typeColors[pokemon.type],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar Pokémon
              Image.network(pokemon.image),
              SizedBox(height: 10),
              // Menampilkan tipe Pokémon
              Text(
                'Type: ${pokemon.type}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Menampilkan ID Pokémon
              Text('ID: ${pokemon.id}'),
              SizedBox(height: 10),
              // Menampilkan statistik dalam bentuk indikator vertikal
              Text('Statistik:', style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                height: 200, // Tentukan tinggi container statistik
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.statistik.map((statistik) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Menampilkan statistik sebagai indikator vertikal
                        Text('HP:'),
                        _buildVerticalIndicator(statistik.hp, Colors.green),
                        SizedBox(height: 10),
                        Text('Stamina:'),
                        _buildVerticalIndicator(statistik.stamina, Colors.blue),
                        SizedBox(height: 10),
                        Text('Ketahanan:'),
                        _buildVerticalIndicator(statistik.ketahanan, Colors.orange),
                        SizedBox(height: 10),
                        Text('Kecepatan:'),
                        _buildVerticalIndicator(statistik.kecepatan, Colors.red),
                        SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              // Menampilkan evolusi Pokémon
              Text('Evolusi:', style: TextStyle(fontWeight: FontWeight.bold)),
              for (var evolusi in pokemon.evolusi) ...[
                Row(
                  children: [
                    Image.network(evolusi.image, width: 50, height: 50),
                    SizedBox(width: 10),
                    Text(evolusi.nama),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Membuat indikator vertikal berdasarkan nilai statistik
  Widget _buildVerticalIndicator(int value, Color color) {
    double maxValue = 100.0; // Anggap statistik maksimum adalah 100
    double percentage = (value / maxValue); // Menghitung persentase dari nilai statistik
    double height = percentage * 200; // Skala tinggi indikator berdasarkan persentase (maksimal 200px)

    // Menentukan ketebalan berdasarkan persentase
    double width = 30 + (percentage * 20); // Lebar indikator akan semakin besar dengan nilai yang lebih tinggi

    return Container(
      width: width, // Lebar container indikator, tergantung pada persentase
      height: 200, // Tinggi container statistik
      decoration: BoxDecoration(
        color: Colors.grey[200], // Warna latar belakang container
        borderRadius: BorderRadius.circular(10), // Untuk memberikan sudut yang halus
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width, // Lebar indikator vertikal
              height: height, // Tinggi indikator berdasarkan persentase
              decoration: BoxDecoration(
                color: color, // Warna indikator vertikal
                borderRadius: BorderRadius.circular(10), // Sudut yang halus
              ),
            ),
          ),
        ],
      ),
    );
  }
}
