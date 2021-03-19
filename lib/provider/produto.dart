import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProdutoProvider with ChangeNotifier {
  final String _baseUrl = '/produto';
  final String url = 'localhost:3030';
  ProdutoProvider([this._listProdutoProvider = const []]);

  //onde se encontra os dados do objeto
  List<Produto> _listProdutoProvider = [];
  //função que retorna os dados da lista=
  List<Produto> get listProduto => [..._listProdutoProvider];
  //metodo reponsavel por pegar tamanho dos anuncios
  int get marcaQtd {
    return _listProdutoProvider.length;
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<void> createProduto(Produto novoProduto) async {
    final response = await http.post(
      Uri.https(url, _baseUrl),
      headers: requestHeaders,
      body: json.encode({
        'id': novoProduto.id,
        ' descricao': novoProduto.descricao,
        'precoCusto': novoProduto.precoCusto,
        'precoFinal': novoProduto.precoFinal,
        'qtde': novoProduto.qtde,
        'unMed': novoProduto.unMed,
      }),
    );
    _listProdutoProvider.add(Produto(
      id: json.decode(response.body)['id'],
      qtde: novoProduto.qtde,
      unMed: novoProduto.unMed,
      descricao: novoProduto.descricao,
      precoCusto: novoProduto.precoCusto,
      precoFinal: novoProduto.precoFinal,
    ));
    notifyListeners();
    if (response.statusCode == 201) {
      return Produto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Não foi possivel carregar o produto');
    }
  }

/*  id: json['id'],
        descricao: json['descricao'],
        precoCusto: json['precocusto'],
        precoFinal: json['precofinal'],
        qtde: json['qtde'],
        unMed: json['unmed']); */
  //metodo responsavel por adicionar um novo anuncio na lista de anuncios

}

Future<http.Response> postRequest() async {
  Map data = {'apikey': '12345678901234567890'};
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(
      Uri.https(
        url,
        '/produto',
      ),
      headers: {"Content-Type": "application/json"},
      body: body);
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}

final String url = 'localhost:3030';
Future<List<Produto>> pegarDadosJson() async {
  var response = await http.get(
    Uri.http(url, '/produto'),
  );
  if (response.statusCode == 200) {
    final listaItens = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Produto> produtoLista = listaItens.map<Produto>((json) {
      return Produto.fromJson(json);
    }).toList();
    return produtoLista;
  } else {
    throw Exception('Falha em carregar os dados');
  }
}

class Produto {
  final String id;
  final String qtde;
  final String unMed;
  final String descricao;
  final String precoCusto;
  final String precoFinal;

  Produto(
      {this.id,
      this.qtde,
      this.unMed,
      this.descricao,
      this.precoCusto,
      this.precoFinal});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        id: json['id'],
        descricao: json['descricao'],
        precoCusto: json['precocusto'],
        precoFinal: json['precofinal'],
        qtde: json['qtde'],
        unMed: json['unmed']);
  }
}
