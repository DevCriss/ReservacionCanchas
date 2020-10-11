import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  final _agendamientosTableName = 'agendamientos';
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'canchas.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $_agendamientosTableName('
          ' id INTEGER PRIMARY KEY,'
          ' cancha TEXT,'
          ' usuario TEXT,'
          ' fecha TEXT,'
          ' probabilidadLluvia INTEGER'
          ')');
    });
  }

  addAgendamiento(AgendamientoModel nuevoAgendamiento) async {
    final db = await database;

    final res =
        await db.insert(_agendamientosTableName, nuevoAgendamiento.toJson());

    return res;
  }

  Future<List<AgendamientoModel>> getAgendamientos() async {
    final db = await database;

    final res = await db.query(_agendamientosTableName);

    List<AgendamientoModel> list = res.isNotEmpty
        ? res.map((e) => AgendamientoModel.fromJson(e)).toList()
        : [];

    return list;
  }

  Future<int> deleteAgendamiento(int id) async {
    final db = await database;

    final res = await db
        .delete(_agendamientosTableName, where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<bool> isAbleToSave(String fecha, String cancha) async {
    final db = await database;

    final res = await db.query(_agendamientosTableName,
        where: 'fecha = ? AND cancha = ?', whereArgs: [fecha, cancha]);

    return res.length < 3;
  }
}
