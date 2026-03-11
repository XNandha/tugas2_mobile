import 'package:flutter/material.dart';

import 'pages/aritmatika_page.dart';
import 'pages/bilangan_page.dart';
import 'pages/total_page.dart';
import 'pages/stopwatch_page.dart';
import 'pages/piramid_page.dart';
import 'login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // =========================
  // CARD MENU
  // =========================
  Widget menuCard(BuildContext context, String text, IconData icon, Widget page) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xfff5f7fa),
                Color(0xffc3cfe2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 45,
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================
  // DATA KELOMPOK
  // =========================
  void showKelompok(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Data Kelompok"),
          content: const Text(
            "Cakalika Fernandha Laksono\n123230206",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // LOGOUT
  // =========================
  void konfirmasiLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Apakah anda yakin ingin logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // UI
  // =========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            konfirmasiLogout(context);
          },
        ),
        title: const Text(
          "Menu Utama",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.group),
            onPressed: () {
              showKelompok(context);
            },
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [

              menuCard(
                context,
                "Penjumlahan & Pengurangan",
                Icons.calculate,
                AritmatikaPage(),
              ),

              menuCard(
                context,
                "Bilangan Ganjil / Genap / Prima",
                Icons.numbers,
                BilanganPage(),
              ),

              menuCard(
                context,
                "Jumlah Total Angka",
                Icons.summarize,
                TotalPage(),
              ),

              menuCard(
                context,
                "Stopwatch",
                Icons.timer,
                StopwatchPage(),
              ),

              menuCard(
                context,
                "Luas & Volume Piramid",
                Icons.change_history,
                PiramidPage(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}