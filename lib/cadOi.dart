//essa é a tela de cadastro de equipamentos da OI

//Dependências necessárias
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';

//Faz parte da criação da tela "cadOi"
class cadOi extends StatefulWidget {
  @override
  _cadOiState createState() => _cadOiState();
}

final _formKey = GlobalKey<FormState>();

//---AQUI SÃO OS CONTROLADORES DAS CAIXAS, OU SEJA PARA ONDE VÃO OS DADOS
TextEditingController nomeController = TextEditingController();
TextEditingController cpfController = TextEditingController();
TextEditingController rgController = TextEditingController();
TextEditingController datanascimentoController = TextEditingController();
TextEditingController nomemaeController = TextEditingController();
TextEditingController enderecoController = TextEditingController();
TextEditingController tel1Controller = TextEditingController();
TextEditingController tel2Controller = TextEditingController();
TextEditingController modeloController = TextEditingController();
TextEditingController contratoController = TextEditingController();
TextEditingController caidprincipalController = TextEditingController();
TextEditingController caid2Controller = TextEditingController();
TextEditingController caid3Controller = TextEditingController();
TextEditingController caid4Controller = TextEditingController();
TextEditingController caid5Controller = TextEditingController();
TextEditingController cartaoprincipalController = TextEditingController();
TextEditingController cartao2Controller = TextEditingController();
TextEditingController cartao3Controller = TextEditingController();
TextEditingController cartao4Controller = TextEditingController();
TextEditingController cartao5Controller = TextEditingController();

//----------------------------------------------------------------------------

final dbHelper = DatabaseHelper.instance;

//aqui cria a nossa tela
class _cadOiState extends State<cadOi> {
  //esse _modeloCad serve APENAS para alterar o texto da barra, quando a opção de modelo for alterada
  String _modeloCad = "";

  //aqui define que por padrão o radioButton do medelo "Elsys" que é o 0, por padrão vai vir sempre marcado
  int _radioValue = 3;

  //serve para limpar todos dados da tela
  void _limparDados() {
    setState(() {
      nomeController.text = "";
      cpfController.text = "";
      rgController.text = "";
      datanascimentoController.text = "";
      nomemaeController.text = "";
      enderecoController.text = "";
      tel1Controller.text = "";
      tel2Controller.text = "";
      modeloController.text = "";
      contratoController.text = "";
      caidprincipalController.text = "";
      caid2Controller.text = "";
      caid3Controller.text = "";
      caid4Controller.text = "";
      caid5Controller.text = "";
      cartaoprincipalController.text = "";
      cartao2Controller.text = "";
      cartao3Controller.text = "";
      cartao4Controller.text = "";
      cartao5Controller.text = "";
    });
  }

/*essa parte eu peguei da internet e serve para alterar o texto da barra
e o valor do controlador quando o usuário alterar o modelo
 */
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        //caso o radio 0 for marcado o controlador recebe 0
        // pq pensei tipo em economizar espaço no banco pra toda vez nã colocar "Elsys" ou "Bedin"
        //ele cadastra tipo 0 para Elsys, 1 para Bedin e 2 para ambas
        case 0:
          _modeloCad = ": Elsys";
          modeloController.text = "Elsys";
          break;
        case 1:
          _modeloCad = ": Bedin";
          modeloController.text = "Bedin";
          break;
        case 2:
          _modeloCad = ": Ambas";
          modeloController.text = "Ambas";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova OI TV$_modeloCad"), //texto da barra
        centerTitle: true, //centraliza
        backgroundColor: Colors.pink, //cor da barra
        actions: <Widget>[
          IconButton(
            //adiciona um botão na barra (para limpar os dados)
            icon: Icon(Icons.clear),
            onPressed: _limparDados, //chama a função de limpar
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black87,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            autovalidate: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //cria uma caixa de texto, para cada uma vai todo esse código
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O nome esta vazio ! ';
                    }
                    return null;
                  },
                  //tipo do teclado em Text para texo
                  cursorColor: Colors
                      .white, //cor do cursor (aquela barrinha enquanto está digitando)
                  decoration: InputDecoration(
                      border: InputBorder
                          .none, //tira a borda padrão da caixa de texto
                      labelText: "Nome completo", //lengenda
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ), //icone e sua formatação
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign
                      .start, //alinhamento do texto digitado (Esquerad pra direita)
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0), //estilo do texto a ser digitado
                  controller: nomeController,

                  //cont// rolador responsável pela caixa
                ),

                //Isso se repete em todos os outros

                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O CPF esta vazio ! ';
                    } else if (value.length != 11) {
                      return 'CPF deve conter 11 números ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CPF",
                      icon: Icon(
                        Icons.security,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cpfController,
                ),

                TextFormField(
                  maxLength: 12,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O RG esta vazio ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "RG",
                      icon: Icon(
                        Icons.security,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: rgController,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'A data de nascimento esta vazia  ! ';
                    } else if (value.length != 8) {
                      return 'A data deve estar no formato dd/mm/yyyy ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Data de nascimento",
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: datanascimentoController,
                ),

                TextFormField(
                  maxLength: 40,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O nome da mae esta vazio ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Nome da mãe",
                      icon: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: nomemaeController,
                ),

                TextFormField(
                  maxLength: 50,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O endereco esta vazio ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Endereço",
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: enderecoController,
                ),

                TextFormField(
                  maxLength: 15,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O telefone esta vazio ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "1º Telefone",
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: tel1Controller,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "2º Telefone",
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: tel2Controller,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Modelo: ",
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white))
                      ]),
                ),

                //Aqui cria uma linha para os modelos
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //criando a "caixa de seleção" do medelo
                    new Radio(
                      activeColor: Colors.pink, //cor de quando estiver marcada
                      value: 0, //o valor del

                      groupValue:
                          _radioValue, //seu grupo, tem q ser o mesmo dos outros para só podermos marcar um
                      onChanged:
                          _handleRadioValueChange, //e quando marcada ela chama aquele método lá em sima para validar o valor
                    ),
                    //Cada radio tem seu texto correspondente
                    new Text(
                      'Elsys', //o texto
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.white), //a formatação
                    ),

                    new Radio(
                      activeColor: Colors.pink,
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Bedin',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ),

                    new Radio(
                      activeColor: Colors.pink,
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Ambas',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),

                //finaliza a linha e volta para a coluna

                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O numero do contrato nao foi inserido ! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Contrato",
                      icon: Icon(
                        Icons.check_box,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  //controller:,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CAID principal",
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: caidprincipalController,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CAID 2",
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: caid2Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CAID 3",
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: caid3Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CAID 4",
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: caid4Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "CAID 5",
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: caid5Controller,
                ),

                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O cartão não foi inserido! ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Cartão principal",
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cartaoprincipalController,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Cartão 2",
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cartao2Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Cartão 3",
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cartao3Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Cartão 4",
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cartao4Controller,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Cartão 5",
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  controller: cartao5Controller,
                ),

                //TUDO ASSEGUIR É PARA O BOTÃO CADASTRAR
                Padding(
                  //Padding é para por um espaço entro o ultimo texto e o botão
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0), //define esse espaçamento
                  child: Container(
                    height: 50.0, //altura do botão
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _inserir();
                        } else {
                          print('erro');
                        }
                      },
                      child: Text(
                        "Cadastrar", //emfim o texto do botão
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0), //e o estilo do texto
                      ),
                      color: Colors.pink,
                    ),
                  ),
                ),

                Padding(
                  //Padding é para por um espaço entro o ultimo texto e o botão
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0), //define esse espaçamento
                  child: Container(
                    height: 50.0, //altura do botão
                    child: RaisedButton(
                      onPressed: () {
                        _consultar();
                      },
                      child: Text(
                        "Ver cadastros", //emfim o texto do botão
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0), //e o estilo do texto
                      ),
                      color: Colors.amber,
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
}

void _inserir() async {
  // linha para incluir
  Map<String, dynamic> row = {
    DatabaseHelper.columnNomeCompleto: nomeController.text,
    DatabaseHelper.columnCpf: cpfController.text,
    DatabaseHelper.columnRg: rgController.text,
    DatabaseHelper.columnDataNascimento: datanascimentoController.text,
    DatabaseHelper.columnNomeDaMae: nomemaeController.text,
    DatabaseHelper.columnEndereco: enderecoController.text,
    DatabaseHelper.columnTelefone1: tel1Controller.text,
    DatabaseHelper.columnTelefone2: tel2Controller.text,
    DatabaseHelper.columnModelo: modeloController.text,
    DatabaseHelper.columnContrato: contratoController.text,
    DatabaseHelper.columnCaidPrincipal: caidprincipalController.text,
    DatabaseHelper.columnCaid2: caid2Controller.text,
    DatabaseHelper.columnCaid3: caid3Controller.text,
    DatabaseHelper.columnCaid4: caid4Controller.text,
    DatabaseHelper.columnCaid5: caid5Controller.text,
    DatabaseHelper.columnCartaoPrincipal: cartaoprincipalController.text,
    DatabaseHelper.columnCartao2: cartao2Controller.text,
    DatabaseHelper.columnCartao3: cartao3Controller.text,
    DatabaseHelper.columnCartao4: cartao4Controller.text,
    DatabaseHelper.columnCartao5: cartao5Controller.text
  };
  final id = await dbHelper.insert(row);
  print('linha inserida id: $id');
  print(nomeController.text);
}

void _consultar() async {
  final todasLinhas = await dbHelper.queryAllRows();
  print('Consulta todas as linhas:');
  todasLinhas.forEach((row) => print(row));
}
