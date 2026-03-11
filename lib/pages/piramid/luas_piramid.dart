import 'package:flutter/material.dart';

class LuasPiramidPage extends StatefulWidget {
  const LuasPiramidPage({super.key});

  @override
  State<LuasPiramidPage> createState() => _LuasPiramidPageState();
}

class _LuasPiramidPageState extends State<LuasPiramidPage> {
  final alasController = TextEditingController();
  final sisiController = TextEditingController();

  double luas = 0;

  void hitungLuas() {
    if (alasController.text.isEmpty || sisiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan luas alas dan tinggi sisi")),
      );
      return;
    }

    final double alas = double.parse(alasController.text);
    final double sisi = double.parse(sisiController.text);

    setState(() {
      luas = alas + (4 * (0.5 * alas * sisi));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Luas Piramid",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff2193b0),
                Color(0xff6dd5ed),
              ],
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
                    controller: alasController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Luas Alas",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.square_foot),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: sisiController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Tinggi Sisi (untuk luas)",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: hitungLuas,
                      child: const Text("Hitung Luas Piramid"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Luas Piramid = ${luas.toStringAsFixed(2)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
