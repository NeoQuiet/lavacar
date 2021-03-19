import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrdensProvider with ChangeNotifier {
  final String id;
  final String idOrdem;
  final String produto;
  final String veiculo;
  final String cliente;

  OrdensProvider(
      {this.id, this.idOrdem, this.produto, this.veiculo, this.cliente});

//onde se encontra os dados do objeto
  List<OrdensProvider> _listOrdensProvider = [];
  //get da lista anterior em um array
  List<OrdensProvider> get listMarca => [..._listOrdensProvider];
  //quantidade de itens no array
  int get marcaQtd {
    return _listOrdensProvider.length;
  }

  factory OrdensProvider.fromJson(Map<String, dynamic> json) {
    return OrdensProvider(
      id: json['id'],
      idOrdem: json['idordem'],
      cliente: json['cliente'],
      produto: json['produto'],
      veiculo: json['veiculo'],
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

final String url = 'localhost:3030';
Future<List<OrdensProvider>> pegarDadosJson() async {
  var response = await http.get(
    Uri.http(url, '/ordens'),
  );
  if (response.statusCode == 200) {
    final listaOrdens = json.decode(response.body).cast<Map<String, dynamic>>();
    List<OrdensProvider> ordensLista = listaOrdens.map<OrdensProvider>((json) {
      return OrdensProvider.fromJson(json);
    }).toList();
    return ordensLista;
  } else {
    throw Exception('Falha em carregar os dados');
  }
}
