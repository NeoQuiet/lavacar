import 'package:flutter/material.dart';
import 'package:lavacar/provider/cliente.dart';
import 'package:lavacar/provider/marca.dart';

class VeiculoProvider with ChangeNotifier {
  final String id;
  final ClienteProvider idCliente;
  final MarcaProvider idMarca;
  final String placa;
  final String cor;

  VeiculoProvider({
    this.cor,
    this.id,
    this.idCliente,
    this.idMarca,
    this.placa,
  });
}
