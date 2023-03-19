import 'package:cfmkids/screens/signup.dart';
import 'package:cfmkids/widgets/loginW.dart';
import 'package:cfmkids/widgets/signUpW.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key, required String title});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  bool _isExpandedFlex = false;

  void _swapExpandedFlex() {
    setState(() {
      _isExpandedFlex = !_isExpandedFlex;
    });
  }

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
            if (ancho.maxWidth < 650) {
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
                  child: Column(children: [
                    Flexible(
                      flex: _isExpandedFlex ? 1 : 8,
                      child:
                          Container(
                            color: Colors.blueGrey, 
                            child: const SignupWid()),
                    ),

                    GestureDetector(
                      onTap: _swapExpandedFlex,
                      child: Flexible(
                          flex: _isExpandedFlex ? 8 : 1,
                          child: Container(
                            color: Colors.red,
                            child: Text("hola perro"),
        
                          )),
                    )
                  ]),
                ),
              );
            } else if (ancho.maxWidth < 1200) {
              return Center(
                child: Container(
                  width: screenW - 350,
                  height: screenH - 100,
                  color: const Color.fromARGB(255, 22, 213, 98),
                  child: Row(
                    children: const [
                      Expanded(
                        child: SignupWid(),
                      ),
                      Expanded(child: LoginWid()),
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
                    child: Row(children: const <Widget>[
                      Expanded(child: SignupWid()),
                      Expanded(child: LoginWid())
                    ])),
              );
            }
          },
        ),
      ),
    );
  }
}
