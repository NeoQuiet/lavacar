import 'package:flutter/material.dart';
import 'package:lavacar/widget/manter_produto.dart';
import 'package:lavacar/widget/drawer.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: AppDrawer(),
      body: _body(),
    );
  }
}

_body() {
  return ManterProduto();
}

_appBar() {
  return AppBar(
    actions: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.electrical_services_rounded,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Conectado',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    ],
    title: Text(
      'PRODUTOS',
      style: TextStyle(
        color: Colors.red,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    ),
  );
}
