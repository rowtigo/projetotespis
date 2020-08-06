import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: cadastrosOi()));
}

class cadastrosOi extends StatefulWidget {
  @override
  _cadastrosOiState createState() => _cadastrosOiState();
}

class _cadastrosOiState extends State<cadastrosOi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Cadastros OI TV"),
            backgroundColor: Colors.pink,
            centerTitle: true,
            leading: IconButton(
              //adiciona um botão na barra (para limpar os dados)
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }, //chama a função de limpar
            )),
        body: Container(
          color: Colors.black87,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'Rodrigo Gabriel Gossi',
                  style: TextStyle(color: Colors.white, fontSize: 23.0),
                ),
                subtitle: Text(
                  "CPF: 123456789-11 \nRG: 123456\nData de nascimento: 24/01/2005\nNome da mãe: Rosmari B.H Gossi\nEndereço: AV.B Santa Luzia\nTelefone 1: 46999999999\nTelefone 2: NÃO INFORMADO!\nModelo: Elsys\nContrato: 12456898\nCAID Principal: 3211456\nCAID 2: NÃO INFORMADO!\nCAID3: NÃO INFORMADO!\nCAID 4: NÃO INFORMADO!\nCAID 5: NÃO INFORMADO!\nCartão Principal: NÃO INFORMADO!\nCartão 2: NÃO INFORMADO!\nCartão 3: NÃO INFORMADO!\nCartão 4: NÃO INFORMADO!\nCartão 5: NÃO INFORMADO!",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Joana Conseição',
                    style: TextStyle(color: Colors.white, fontSize: 23.0)),
                subtitle: Text(
                  "CPF: 24123123-21 \nRG: 215489\nData de nascimento: 04/12/1995\nNome da mãe: Ana Beatriz\nEndereço: Rua das palmeiras\nTelefone 1: 46999999999\nTelefone 2: 54464564\nModelo: Bedin\nContrato: 5464\nCAID Principal: 5452344654\nCAID 2: 4244541524154\nCAID3: 544545\nCAID 4: 45454554\nCAID 5: NÃO INFORMADO!\nCartão Principal: NÃO INFORMADO!\nCartão 2: NÃO INFORMADO!\nCartão 3: NÃO INFORMADO!\nCartão 4: NÃO INFORMADO!\nCartão 5: NÃO INFORMADO!",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text('Paulo Amaral',
                    style: TextStyle(color: Colors.white, fontSize: 23.0)),
                subtitle: Text(
                  "CPF: 1245562 \nRG: 1223145\nData de nascimento: 05/07/1999\nNome da mãe: Paola cristina amaral\nEndereço: Rua das palmeiras\nTelefone 1: 46999999999\nTelefone 2: 54464564\nModelo: Bedin\nContrato: 5464\nCAID Principal: 5452344654\nCAID 2: 4244541524154\nCAID3: 544545\nCAID 4: 45454554\nCAID 5: NÃO INFORMADO!\nCartão Principal: NÃO INFORMADO!\nCartão 2: NÃO INFORMADO!\nCartão 3: NÃO INFORMADO!\nCartão 4: NÃO INFORMADO!\nCartão 5: NÃO INFORMADO!",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
