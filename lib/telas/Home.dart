import 'package:flutter/material.dart';
import 'IMC.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue, //Colors.lightBlue,
        appBar: AppBar(
          title: const Text("Calculadora de IMC",
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 64,
        ),
        body: Container(
          margin: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "IMC (índice de massa corporal)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.normal
                      ),
                      "O IMC é uma medida internacional usada para calcular se uma pessoa está no seu peso ideal, basendo-se na relação entre seu peso e sua altura. ",
                      textAlign: TextAlign.center,
                      )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const IMC()));
                },
                child: const Text(
                  "Quero calcular meu IMC",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(46.0),
              child: Image.asset("assets/IMCCalc.png",
                  height: 128,
              ),
            )
          ]),
        ));
  }
}
