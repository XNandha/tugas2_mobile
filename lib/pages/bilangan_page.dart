import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final angka = TextEditingController();
  String hasil = "";

  void cek() {
    if (angka.text.isEmpty) {
      setState(() {
        hasil = "Masukkan angka terlebih dahulu";
      });
      return;
    }

    int n = int.parse(angka.text);

    String ganjilGenap = (n % 2 == 0) ? "Genap" : "Ganjil";

    bool prima = true;

    if (n <= 1) prima = false;

    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) {
        prima = false;
        break;
      }
    }

    setState(() {
      hasil =
          "Bilangan $ganjilGenap\n${prima ? "Bilangan Prima" : "Bukan Prima"}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cek Bilangan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe3f2fd), Color(0xffbbdefb), Color(0xff90caf9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: angka,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Masukkan Angka",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: cek,
                      child: const Text("Cek Bilangan"),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        hasil,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
