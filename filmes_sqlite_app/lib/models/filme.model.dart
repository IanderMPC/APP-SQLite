import 'package:floor/floor.dart';
@entity
class Filme {
  @PrimaryKey(autoGenerate: true)
  int id;
  String titulo;
  bool assistido;
  Filme({this.id, this.titulo, this.assistido});
  Filme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['nome'];
    assistido = json['assistido'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['assistido'] = this.assistido;
    return data;
  }
}
