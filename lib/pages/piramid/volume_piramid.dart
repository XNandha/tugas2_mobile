import 'package:flutter/material.dart';

class VolumePiramidPage extends StatefulWidget {
  const VolumePiramidPage({super.key});

  @override
  State<VolumePiramidPage> createState() => _VolumePiramidPageState();
}

class _VolumePiramidPageState extends State<VolumePiramidPage> {
  final alasController = TextEditingController();
  final tinggiController = TextEditingController();

  double volume = 0;

  void hitungVolume() {
    if (alasController.text.isEmpty || tinggiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan luas alas dan tinggi")),
      );
      return;
    }

    final double alas = double.parse(alasController.text);
    final double tinggi = double.parse(tinggiController.text);

    setState(() {
      volume = (1 / 3) * alas * tinggi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Volume Piramid",
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
                    controller: tinggiController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Tinggi Piramid",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: hitungVolume,
                      child: const Text("Hitung Volume"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Volume = ${volume.toStringAsFixed(2)}",
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
