import 'package:flutter/material.dart';
import 'package:pokemon/pages/Home/search%20copy.dart';
import 'package:pokemon/pages/Pokedex/data.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsif padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, screenHeight),
              _buildList(context, screenWidth),
              _buildNews(context, screenWidth),
            ],
          ),
        ),
      ),
    );
  }
 // If no search query, show a prompt
              
  PreferredSizeWidget _buildAppbar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/logo.png',
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navigasi ke halaman pencarian (contoh placeholder)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchHome()));
          },
          icon: const Icon(
            Icons.search_sharp,
            color: Colors.white,
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xff05121F),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double screenHeight) {
    return Container(
      height: screenHeight * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/banerr.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildList(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PokemonListPage()),
                    );
                  },
                  child: _buildCategoryItem(
                    context,
                    'Pokedex',
                    const Color(0xffE5BE10),
                    screenWidth * 0.45,
                  ),
                ),
              ),
              _buildCategoryItem(
                context,
                'News',
                const Color(0xff138268),
                screenWidth * 0.45,
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryItem(
                context,
                'Attackdex',
                const Color(0xffA21637),
                screenWidth * 0.45,
              ),
              _buildCategoryItem(
                context,
                'Items',
                const Color(0xff1E76BF),
                screenWidth * 0.45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, String title, Color color, double width) {
    return Container(
      height: width * 0.45,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.09),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          const Image(
            image: AssetImage('assets/bola.png'),
            width: 70,
            height: 70,
          )
        ],
      ),
    );
  }

  Widget _buildNews(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        children: [
          Container(
            height: screenWidth * 0.05,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff061626),
              border: Border(
                bottom: BorderSide(color: Colors.white70, width: 1),
              ),
            ),
            child: const Text(
              'Cuplikan Berita Terbaru',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(2, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.03),
                  child: Container(
                    width: screenWidth * 0.7,
                    height: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F4F4),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '16 Karakter Pokémon yang Ikonik',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '07 Mei 2024',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/news.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
