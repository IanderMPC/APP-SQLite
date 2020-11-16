


import 'dart:async';

import 'package:filmes_sqlite_app/models/filme.model.dart';
import 'package:filmes_sqlite_app/repositories/filme.dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'filme.database.g.dart'; // the generated code will be there

@Database(version: 1,entities: [Filme])
abstract class AppDatabase extends FloorDatabase{
  FilmeDao get filmeDao;
}
