// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Fatec Ferraz- Controle de Alunos",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Ainda há vagas \n pode entrar!";
  Color _color = Colors.greenAccent;

  _alteraContador(int i) {
    setState(() {
      _pessoa += i;

      if (_pessoa <= 0) {
        _mensagem = "Ainda chegou ninguem!";
        _pessoa = 0;
        _color = Colors.red;
      } else if (_pessoa > 50) {
        _mensagem = "Está Lotado! \n Por favor, aguarde!";
        _color = Colors.red;
        _pessoa = 50;
      } else if (_pessoa < 50) {
        _mensagem = "Ainda há vagas \n pode entrar!";
        _color = Colors.greenAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "../images/EZD8RF.png",
          fit: BoxFit.cover,
          height: 900,
        ),
        Container(
          color: Color.fromARGB(150, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoas: $_pessoa",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      onPressed: () {
                        _alteraContador(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      onPressed: () {
                        _alteraContador(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _mensagem,
                style: TextStyle(
                  color: _color,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                ),
              ), //
            ],
          ),
        )
      ],
    );
  }
}
