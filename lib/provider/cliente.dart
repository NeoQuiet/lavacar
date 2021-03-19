import 'package:flutter/material.dart';

class ClienteProvider with ChangeNotifier {
  final String id;
  final String nome;
  final String telefone;

  ClienteProvider({
    this.id,
    this.nome,
    this.telefone,
  });
}
