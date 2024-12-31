import 'package:flutter/material.dart';
import 'package:pokemon/pages/Home/home_screen.dart';
import 'package:pokemon/pages/Search/search.dart';


class TombolNav extends StatefulWidget {
  const TombolNav({super.key});

  @override
  State<TombolNav> createState() => _TombolNavState();
}

class _TombolNavState extends State<TombolNav> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman untuk setiap tab
    final List<Widget> listPage = <Widget>[
      const HomeScreen(),
      const Search(), // Placeholder untuk Search
      Container(), // Placeholder untuk Profile
    ];

    // Daftar item navigasi bawah
    final List<BottomNavigationBarItem> bottomNavBarItems =
        <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.home_filled),
        ),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.search_outlined),
        ),
        label: 'Search',
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(Icons.person),
        ),
        label: 'Profile',
      ),
    ];

    // BottomNavigationBar
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff05121F),
      items: bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: const Color(0xFF434343), // Warna yang benar
      selectedItemColor: Colors.white,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: bottomNavBar, // Tambahkan di sini
    );
  }
}
