


import 'package:filmes_sqlite_app/models/filme.model.dart';
import 'package:filmes_sqlite_app/repositories/filme.repository.dart';
import 'package:mobx/mobx.dart';

import '../app_status.dart';
part 'filme.controller.g.dart';

class FilmeController = _FilmeController with _$FilmeController;
abstract class _FilmeController with Store{
  FilmeRepository repository;

  _FilmeController(){
    _init();
  }
  Future<void> _init() async {
    repository = await FilmeRepository.getInstance();
    await getAll();
  }
  @observable
  AppStatus status = AppStatus.none;
  @observable
  ObservableList<Filme> list = ObservableList<Filme>();
  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      if(repository != null) {
        final allList = await repository.getAll();
        list.clear();
        list.addAll(allList);
      }

      status = AppStatus.success;
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }
  @action
  Future<void> create(Filme f) async {
    status = AppStatus.loading;
    try {
      await repository.create(f);
      await getAll();
      status = AppStatus.success;
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }
  @action
  Future<void> update(Filme f) async {
    status = AppStatus.loading;
    try {
      await repository.update(f);
      await getAll();
      status = AppStatus.success;
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }
  @action
  Future<void> delete(int id) async {
    status = AppStatus.loading;
    try {
      await repository.delete(id);
      await getAll();
      status = AppStatus.success;
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }
}
