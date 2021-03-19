import 'package:lavacar/provider/produto.dart';

class ServicoProvider {
  final String id;
  final ProdutoProvider produto;
  final String descricao;
  final String precoCusto;
  final String precoFinal;

  ServicoProvider({
    this.descricao,
    this.id,
    this.precoCusto,
    this.precoFinal,
    this.produto,
  });
}
