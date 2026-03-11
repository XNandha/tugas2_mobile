import 'package:flutter/material.dart';
import 'menu_page.dart';

class LoginPage extends StatelessWidget {

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Login",
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

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.person,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {

                    if(username.text == "Nandha" && password.text == "123"){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuPage()
                        )
                      );

                    } else {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Username atau Password salah"),
                        )
                      );

                    }

                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}