import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/widgets/colortext.dart';

class SigupForm extends StatefulWidget {
  const SigupForm({super.key});

  @override
  State<SigupForm> createState() => _SigupFormState();
}

class _SigupFormState extends State<SigupForm> {
  bool _isPasswordViible = false;
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
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                  Center(child: Lottie.asset('assets/bulbasur.json')),
                  const SizedBox.shrink(),
                  Text('Create Akun', style: titletext),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.white), // Teks yang diketik tetap putih
                    decoration: const InputDecoration(
                      // Label tetap putih
                      hintText: 'nama',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Border saat field aktif
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Border saat field difokuskan
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                            color: Colors.white), // Border saat field difokuskan
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: !_isPasswordViible,
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
                            _isPasswordViible = !_isPasswordViible;
                          });
                        },
                        icon: Icon(_isPasswordViible
                            ? Icons.visibility
                            : Icons.visibility_off),color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Align(
                          child: Text(
                        'Sig Up',
                        style: titlebutton,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                 
                ]),
          ),
        ),
      ),
    );
  }
}
