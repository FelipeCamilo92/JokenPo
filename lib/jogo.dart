import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada (String escolhaUsuario) {

    var opcao = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcao[numero];
    print("Escolha do App: $escolhaApp");
    print("Escolha do Usuário: $escolhaUsuario");

    //exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case "pedra": setState(() {
        this._imagemApp = AssetImage("assets/images/pedra.png");
      }); break;
      case "papel": setState(() {
        this._imagemApp = AssetImage("assets/images/papel.png");
      }); break;
      case "tesoura": setState(() {
        this._imagemApp = AssetImage("assets/images/tesoura.png");
      });
    }

    //validação do ganhador
    if (
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ) {
      setState(() {
        this._mensagem = "Parabéns, você ganhou!";
      });
    } else if (escolhaApp == escolhaUsuario) {
      setState(() {
        this._mensagem = "Empate!";
      });
    } else {
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: Text(
                "Escolha do app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: this._imagemApp,height: 130, width: 110,),
            Padding(
              padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("assets/images/pedra.png", height: 130, width: 110,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("assets/images/papel.png", height: 130, width: 110,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("assets/images/tesoura.png", height: 130, width: 110,),
                ),
                /*
                Image.asset("assets/images/papel.png", height: 130, width: 110,),
                Image.asset("assets/images/pedra.png", height: 130, width: 110,),
                Image.asset("assets/images/tesoura.png", height: 130, width: 110,),
                 */
              ],
            )
          ],
        ),
      ),
    );
  }
}