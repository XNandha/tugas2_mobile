import 'package:flutter/material.dart';

class AritmatikaPage extends StatefulWidget {
  const AritmatikaPage({super.key});

  @override
  State<AritmatikaPage> createState() => _AritmatikaPageState();
}

class _AritmatikaPageState extends State<AritmatikaPage> {

  final angka1 = TextEditingController();
  final angka2 = TextEditingController();

  int hasilTambah = 0;
  int hasilKurang = 0;

  void hitung() {

    int a = int.parse(angka1.text);
    int b = int.parse(angka2.text);

    setState(() {
      hasilTambah = a + b;
      hasilKurang = a - b;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Penjumlahan & Pengurangan",
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

        // background sama seperti menu utama
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffe3f2fd),
              Color(0xffbbdefb),
              Color(0xff90caf9),
            ],
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
                    controller: angka1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Angka 1",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: angka2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Angka 2",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: hitung,
                      child: const Text("Hitung"),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [

                          Text(
                            "Penjumlahan: $hasilTambah",
                            style: const TextStyle(fontSize: 18),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Pengurangan: $hasilKurang",
                            style: const TextStyle(fontSize: 18),
                          ),

                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}