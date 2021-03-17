import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class MarcaProvider with ChangeNotifier {
  final String id;
  final String marca;
  final String dtcad;

  MarcaProvider({this.id, this.dtcad, this.marca});
  //onde se encontra os dados do objeto
  List<MarcaProvider> _listMarcaProvider = [];
  //get da lista anterior em um array
  List<MarcaProvider> get listMarca => [..._listMarcaProvider];
  //quantidade de itens no array
  int get marcaQtd {
    return _listMarcaProvider.length;
  }

  factory MarcaProvider.fromJson(Map<String, dynamic> json) {
    return MarcaProvider(
      id: json['id'],
      marca: json['marca'],
      dtcad: json['dtcad'],
    );
  }
}

void getHttp() async {
  try {
    var url = 'localhost:3030';
    var response = await http.get(
      Uri.http(url, '/marca'),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (e) {
    print(e);
  }
}

/* Future<void> adicionarMarcaLista() async {
    var url = 'localhost:3030';
    var response = await http.get(
      Uri.http(url, '/marca'),
    );
    Map<String, dynamic> data =
        json.decode(response.body).cast<Map<String, dynamic>>().toList();
    _listMarcaProvider.clear();
    if (data != null) {
      data.forEach((id, marcaDados) {
        _listMarcaProvider.add(
          Marca(
            id: id,
            marca: marcaDados['marca'],
            dtcad: marcaDados['dtcad'],
          ),
        );
      });
      notifyListeners();
    }
    return Future.value();

  } */
final String url = 'localhost:3030';
Future<List<MarcaProvider>> pegarDadosJson() async {
  var response = await http.get(
    Uri.http(url, '/marca'),
  );
  if (response.statusCode == 200) {
    final listaItens = json.decode(response.body).cast<Map<String, dynamic>>();
    List<MarcaProvider> marcaLista = listaItens.map<MarcaProvider>((json) {
      return MarcaProvider.fromJson(json);
    }).toList();
    return marcaLista;
  } else {
    throw Exception('Falha em carregar os dados');
  }
}
