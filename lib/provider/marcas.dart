import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:lavacar/model/marca.dart';

class Marcas with ChangeNotifier {
  //onde se encontra os dados do objeto
  List<Marca> _listMarcas;
  //get da lista anterior em um array
  List<Marca> get listMarca => [..._listMarcas];
  //quantidade de itens no array
  int get marcaQtd {
    return _listMarcas.length;
  }

  void inserirMarca(Marca pNovaMarca) {
    const url = 'http://localhost:3030';
    http.post(
      Uri.http(url, '/marca.json'),
      body: json.encode(
        {
          'marca': pNovaMarca.marca,
          'dtcad': pNovaMarca.dtcad,
        },
      ),
    );

    _listMarcas.add(Marca(
      id: Random().nextInt(4).toString(),
      marca: pNovaMarca.marca,
      dtcad: pNovaMarca.dtcad,
    ));
    notifyListeners();
  }
}
