import 'package:filmes_sqlite_app/controllers/filme.controller.dart';
import 'package:filmes_sqlite_app/views/filme.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          Provider<FilmeController>.value(value: FilmeController(),),
        ],
        child: MaterialApp(
          title: 'Lista',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[50],
            primarySwatch: Colors.blueGrey,

          ),
          home: FilmeListView(),
        )
    );
  }
}
