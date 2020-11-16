
import 'package:filmes_sqlite_app/controllers/filme.controller.dart';
import 'package:filmes_sqlite_app/models/filme.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../app_status.dart';

class FilmeListView extends StatefulWidget {
  @override
  _FilmeListViewState createState() => _FilmeListViewState();
}
class _FilmeListViewState extends State<FilmeListView> {
  final _formKey = GlobalKey<FormState>();
  var _itemController = TextEditingController();
  FilmeController _controller = null;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<FilmeController>(context);


    return Scaffold(
      appBar: AppBar(title: Text('Lista de Filmes'), centerTitle: true),
      body: Scrollbar(
        child: Observer(builder: (_) {
          if (_controller.status == AppStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller.status == AppStatus.success) {
            print(_controller.list.length);
            if(_controller.list.length==0){
              _controller.create(Filme(titulo: "Avengers",assistido: false));
              _controller.create(Filme(titulo: "Pulp Fiction",assistido: false));
              _controller.create(Filme(titulo: "Kill Bill 1",assistido: false));
              _controller.create(Filme(titulo: "Kill Bill 2",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 7",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 8",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 9",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 4",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 5",assistido: false));
              _controller.create(Filme(titulo: "Star Wars Episode 6",assistido: false));
            }
            return ListView(
              children: [
                for (int i = 0; i < _controller.list.length; i++)
                  ListTile(

                      title: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: _controller.list[i].assistido
                            ? Text(
                          _controller.list[i].titulo,
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough),
                        )
                            : Text(_controller.list[i].titulo),
                        value: _controller.list[i].assistido,
                        secondary: IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20.0,
                            color: Colors.yellowAccent[700],
                          ),
                          onPressed: () async {
                            await _controller.delete(_controller.list[i].id);
                          },
                        ),
                        onChanged: (c) async {
                          Filme edited = _controller.list[i];
                          edited.assistido = c;
                          await _controller.update(edited);
                        },
                      )),
              ],
            );
          }else{
            return Text("Carregando... ");
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
    );
  }

  _displayDialog(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _itemController,
                validator: (s) {
                  if (s.isEmpty)
                    return "Digite o filme.";
                  else
                    return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Filme"),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text('SALVAR'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _controller.create(Filme(titulo: _itemController.text,
                        assistido: false));
                    _itemController.text = "";
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }
}