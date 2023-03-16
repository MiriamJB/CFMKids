import 'package:cfmkids/login.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'signup.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key, required String title});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg1920x1080.jpg'),
          fit: BoxFit.cover,
        )),
        child: LayoutBuilder(
          builder: (context, ancho) {
            if (ancho.maxWidth < 600) {
              return const Center(
                child: MyHomePage(title: 'Flutter Demo Home Page'),
              );
            } else if (ancho.maxWidth < 950) {
              return Center(
                child: Container(
                  color: Colors.yellow,
                  width: screenW - 250,
                  height: screenH - 100,
                  // child: const MyHomePage(title: 'Flutter Demo Home Page'),
                  child: Text("$screenW"),
                ),
              );
            } else if (ancho.maxWidth < 1200) {
              return Center(
                child: Container(
                  width: screenW - 350,
                  height: screenH - 100,
                  color: Color.fromARGB(255, 22, 213, 98),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                           child: Text("$screenW")),
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.red,
                      )),
                    ],
                  ),
                ),
              );
              // } else if (ancho.maxWidth < 1200) {
              //   return const Center(
              //     child: MyHomePage(title: 'Flutter Demo Home Page'),
              //   );
              // } else if (ancho.maxWidth < 1400) {
              //   return const Center(
              //     child: MyHomePage(title: 'Flutter Demo Home Page'),
              //   );
              // } else if (ancho.maxWidth < 1600) {
              //   return const Center(
              //       child: MyHomePage(title: 'Flutter Demo Home Page'));
            } else {
              return Center(
                child: Container(
                  color: Colors.amber,
                  width: 1200,
                  height: screenH - 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.purple,
                          child: const SignupPage(),
                        )
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: const LoginPage(),
                        )
                      )
                    ]
                  )
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
