import 'package:flutter/material.dart';
import 'Home.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  bool visivel = true;
  double? imc;
  double? altura;
  double? peso;
  String msg = "";
  String imcFormated = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Calcule seu IMC",
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 60,
        ),
        body: Container(
          margin: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: alturaController,
                    decoration: const InputDecoration(
                        label: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                              "Sua altura em centímetros. (Ex: 175)"),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                        label:
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Seu peso em quilogramas. (Ex: 80)"),
                            )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        altura = double.tryParse(alturaController.text);
                        altura = altura! / 100.0;
                        peso = double.tryParse(pesoController.text);
                        imc = peso! / (altura! * altura!);
                        imcFormated = imc!.toStringAsFixed(2);

                        if (imc! <= 18.5) {
                          msg = "Você está baixo do peso.";
                        } else if (imc! <= 24.9) {
                          msg = "Você tem peso normal.";
                        } else if (imc! <= 29.9) {
                          msg = "Você está com sobrepeso.";
                        } else if (imc! <= 39.9) {
                          msg = "Você está obeso.";
                        } else {
                          msg = "Cuidado, você tem obesidade grave.";
                        }
                        setState(() {
                          visivel = !visivel;
                        });
                      },
                      child: const Text("Calcular IMC")),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Visibility(
                    visible: !visivel,
                    child: Text("Seu imc é: $imcFormated. \n$msg"),
                  ),
                ),
                const Divider(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: const Text("Voltar"))
              ],
            )),
          ),
        ));
  }
}
