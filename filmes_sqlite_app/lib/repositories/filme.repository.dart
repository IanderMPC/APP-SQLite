import 'package:filmes_sqlite_app/models/filme.model.dart';
import 'package:filmes_sqlite_app/repositories/filme.dao.dart';
import 'package:filmes_sqlite_app/repositories/filme.database.dart';

class FilmeRepository{
  static FilmeRepository _instance;
  FilmeRepository._();
  AppDatabase database;
  FilmeDao filmeDao;
  static Future<FilmeRepository> getInstance() async{
    if(_instance != null) return _instance;
    _instance = FilmeRepository._();
    await _instance.init();
    return _instance;
  }
  Future<void> init() async {
    database = await $FloorAppDatabase
        .databaseBuilder('filmes.db')
        .build();
    filmeDao = database.filmeDao;

  }
  Future<List<Filme>> getAll() async {
    try {
      return await filmeDao.getAll();
    } catch (e) {
      return List<Filme>();
    }
  }
  Future<bool> create(Filme f) async {
    try {
      await filmeDao.insertFilme(f);
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> update(Filme f) async {
    try {
      await filmeDao.updateFilme(f);
      return true;
    } catch (e) {
      return false;
    }
  }
  Future<bool> delete(int id) async {
    try {
      Filme f = await filmeDao.getFilmeById(id);
      await filmeDao.deleteFilme(f);
      return true;
    } catch (e) {
      return false;
    }
  }
}
