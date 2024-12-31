import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/bottomnav/bottom_navigation.dart';

import 'package:pokemon/pages/Home/home_screen.dart';
import 'package:pokemon/pages/Pokedex/data.dart';
import 'package:pokemon/pages/login/siginup.dart';
import 'package:pokemon/widgets/colortext.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  bool _isPasswordVissible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Lottie.asset('assets/pikachu.json')),
                  const SizedBox.shrink(),
                  Text('Login', style: titletext),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white), // Teks yang diketik tetap putih
                    decoration: const InputDecoration(
                      // Label tetap putih
                      hintText: 'email',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Border saat field aktif
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.white), // Border saat field difokuskan
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: _isPasswordVissible,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVissible = !_isPasswordVissible;
                          });
                        },
                        icon: Icon(_isPasswordVissible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TombolNav()));
                      },
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Align(
                            child: Text(
                          'Login',
                          style: titlebutton,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigupForm(),
                            ),
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
