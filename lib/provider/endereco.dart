import 'package:flutter/material.dart';
import 'package:lavacar/provider/cliente.dart';

class EnderecoProvider with ChangeNotifier {
  final String id;
  final String logradouro;
  final String numero;
  final ClienteProvider idCliente;

  EnderecoProvider({
    this.id,
    this.idCliente,
    this.logradouro,
    this.numero,
  });
}
