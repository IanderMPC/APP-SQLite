// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filme.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilmeController on _FilmeController, Store {
  final _$statusAtom = Atom(name: '_FilmeController.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAtom = Atom(name: '_FilmeController.list');

  @override
  ObservableList<Filme> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Filme> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_FilmeController.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$createAsyncAction = AsyncAction('_FilmeController.create');

  @override
  Future<void> create(Filme f) {
    return _$createAsyncAction.run(() => super.create(f));
  }

  final _$updateAsyncAction = AsyncAction('_FilmeController.update');

  @override
  Future<void> update(Filme f) {
    return _$updateAsyncAction.run(() => super.update(f));
  }

  final _$deleteAsyncAction = AsyncAction('_FilmeController.delete');

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
