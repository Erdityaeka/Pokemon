import 'package:flutter/material.dart';
import 'package:pokemon/pages/Pokedex/data.dart';
import 'package:pokemon/pages/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true; // Untuk mengontrol loading

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // Simulasi pengambilan data (misal dari API atau database)
      await Future.delayed(Duration(seconds: 5), () {
        print('Data berhasil dimuat!');
      });
    } catch (e) {
      print('Error saat memuat data: $e');
    } finally {
      // Navigasi setelah data selesai dimuat
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginform()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/splash.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child:  _isLoading ? CircularProgressIndicator(color: Colors.white,) : SizedBox.expand(),
          )
        ],
      ),
    );
  }
}
