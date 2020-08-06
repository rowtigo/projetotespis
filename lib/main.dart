//Esse é o arquivo inicial do aplicativo, e contém a primeira tela dele a "Home"

/*dependências necessárias incluindo a tela de cadastro,
todas as outras telas do app prescisam ser importadas também
para que possam ser chamadas quando o usuário clicar nas opções do drawer
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadOi.dart';
import 'cadastrosOi.dart';

//classe principal que inncia o app chamando a tela "Home" criada logo abaixo
void main() {
  runApp(MaterialApp(home: Home()));
}

//Faz parte da criação da tela "Home"
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//aqui cria de fato a nossa primeira tela
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //começando aqui :)
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tespis"), //Titúlo da barra
          centerTitle: true, //serve para centralizar o trexo na barra
          backgroundColor: Colors.pink, //define a cor da barra
        ),
        body: Container(
          color: Colors.black87, //esse é a cor do fundo do app (dessa tela)
        ),
        drawer: Drawer(
          //aqui começa o drawer, ou seja o MENU que apareço no lado esquerdo
          child: Container(
            color: Colors.black87, //cor de fundo no menu
            child: ListView(
              //Esse menu tem como filho uma ListView que é o que permite colocar as opções em forma de lista nessa menu
              children: <Widget>[
                ListTile(
                    //aqui cria uma nova opção no menu
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ), //define o icone q tem no dalo esquerdo e sua cor
                    title: Text(
                      "Novo cadastro OI TV",
                      style: TextStyle(color: Colors.white),
                    ), //Texto da opção e sua formatação
                    onTap: () {
                      //"quando apertado" ou seja quando o usuário apertar essa opção..
                      Navigator.push(
                        //chama e tela de cadastro "cadOi"
                        context,
                        MaterialPageRoute(builder: (context) => cadOi()),
                      );
                    }), //fim da primeira opçã
                ListTile(
                    //2°opção
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    title: Text("Pesquisar",
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        //chama e tela de pesquisa "pesquisaOi"
                        context,
                        MaterialPageRoute(builder: (context) => cadastrosOi()),
                      );
                    }) //fim segunda opção
              ],
            ),
          ),
        ),
      ),
    );
  }
}
