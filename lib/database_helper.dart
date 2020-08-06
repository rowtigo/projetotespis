import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tespis/cadOi.dart';

class DatabaseHelper {
  static final _databaseName = "TespisDB.db";
  static final _databaseVersion = 1;

  static final table = 'oitv';

  static final columnId = '_id';
  static final columnNomeCompleto = 'NomeCompleto';
  static final columnCpf = 'cpf';
  static final columnRg = 'rg';
  static final columnDataNascimento = 'dataNascimento';
  static final columnNomeDaMae = 'nomeDaMae';
  static final columnEndereco = 'endereco';
  static final columnTelefone1 = 'telefone1';
  static final columnTelefone2 = 'telefone2';
  static final columnModelo = 'modelo';
  static final columnContrato = 'contrato';
  static final columnCaidPrincipal = 'caidPrincipal';
  static final columnCaid2 = 'caid2';
  static final columnCaid3 = 'caid3';
  static final columnCaid4 = 'caid4';
  static final columnCaid5 = 'caid5';
  static final columnCartaoPrincipal = 'cartaoPrincipal';
  static final columnCartao2 = 'cartao2';
  static final columnCartao3 = 'cartao3';
  static final columnCartao4 = 'cartao4';
  static final columnCartao5 = 'cartao5';

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNomeCompleto TEXT,
            $columnCpf TEXT,
            $columnRg TEXT,
            $columnDataNascimento TEXT,
            $columnNomeDaMae TEXT,
            $columnEndereco TEXT,
            $columnTelefone1 TEXT,
            $columnTelefone2 TEXT,
            $columnModelo TEXT,
            $columnContrato TEXT,
            $columnCaidPrincipal TEXT,
            $columnCaid2 TEXT,
            $columnCaid3 TEXT,
            $columnCaid4 TEXT,
            $columnCaid5 TEXT,
            $columnCartaoPrincipal TEXT,
            $columnCartao2 TEXT,
            $columnCartao3 TEXT,
            $columnCartao4 TEXT,
            $columnCartao5 TEXT
          )
          ''');
  }

  // métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Todos os métodos : inserir, consultar, atualizar e excluir,
  // também podem ser feitos usando  comandos SQL brutos.
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  /*Future<List> getAllNotes() async {
    var banco = await instance.database;
  //  var result = await .query(tableNote, columns: [columnId, columnTitle, columnDescription]);
    var result = await banco.rawQuery('SELECT * FROM $cadOi()');

    return result.toList();
  }*/

}
