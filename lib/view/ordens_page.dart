import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lavacar/widget/drawer.dart';

class OrdensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      drawer: AppDrawer(),
    );
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

  _body() {
    var id = Random().nextInt(999).toString();
    var idOrdem = Random().nextInt(999).toString();

    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ListView(
            children: [
              TextFormField(
                initialValue: id,
                decoration: InputDecoration(labelText: 'Codigo da operação'),
              ),
              TextFormField(
                initialValue: idOrdem,
                decoration: InputDecoration(
                    labelText: 'Codigo de identificação da O.S'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cliente',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Veiculo',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Produtos',
                ),
              ),
              _botaoGuardarOrdem(),
            ],
          ),
        ),
      ),
    );
  }
}

_botaoGuardarOrdem() {
  return ElevatedButton(
      onPressed: () {},
      child: Container(
        child: Text('Guardar Ordem'),
      ));
}
