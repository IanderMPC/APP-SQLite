

import 'package:filmes_sqlite_app/models/filme.model.dart';
import 'package:floor/floor.dart';

@dao
abstract class FilmeDao{
  @Query('SELECT * FROM Filme order by assistido, titulo')
  Future<List<Filme>> getAll();
  @Query("SELECT * from Filme where id = :id")
  Future<Filme> getFilmeById(int id);
  @insert
  Future<int> insertFilme(Filme f);
  @update
  Future<int> updateFilme(Filme f);
  @delete
  Future<int> deleteFilme(Filme f);
}
