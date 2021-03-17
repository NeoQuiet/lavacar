import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lavacar/provider/marca.dart';
import 'package:lavacar/widget/drawer.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* final _formularioDados = Map<String, Object>();

  final _formulario = GlobalKey<FormState>();

  void _salvarFormulario() {
    _formulario.currentState.save();

    final marca = Marca(
      id: _formularioDados['id'],
      marca: _formularioDados['marca'],
      dtcad: _formularioDados['dtcad'],
    );

    Provider.of<Marcas>(context, listen: false).inserirMarca(marca);
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      drawer: AppDrawer(),
      body: _body(),
    );
  }

//função responsavel por mostrar lista de objetos de um json
  _body() {
    return FutureBuilder<List<MarcaProvider>>(
      future: pegarDadosJson(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView(
          children: snapshot.data
              .map(
                (marca) => ListTile(
                  title: Text(marca.marca),
                  subtitle: Text(marca.dtcad),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/carro.jpg'),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

//função responsavel por mostrar capturar
  void getHttp() async {
    try {
      var url = 'localhost:3030';
      var response = await http.get(
        Uri.http(url, '/'),
      );
      print('Response status: ${response.statusCode}');

      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
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
        'APP',
        style: TextStyle(color: Colors.red),
      ),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }
}
