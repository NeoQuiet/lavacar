import 'package:flutter/material.dart';
import 'package:lavacar/provider/produto.dart';
import 'package:provider/provider.dart';

class ManterProduto extends StatefulWidget {
  final ProdutoProvider produtoProvider;

  const ManterProduto({this.produtoProvider});

  @override
  _ManterProdutoState createState() => _ManterProdutoState();
}

class _ManterProdutoState extends State<ManterProduto> {
  //DEFINIR FOCO DOS CAMPOS
  final focusTxtId = FocusNode();
  final focusTxtDesc = FocusNode();
  final focusTxtQtde = FocusNode();
  final focusTxtPrecoCusto = FocusNode();
  final focusTxtPrecoFinal = FocusNode();
  final focusTxtUndMed = FocusNode();
  //CHAVES PARA TER ACESSO A DADOS DOS FORMULARIOS
  final _formulario = GlobalKey<FormState>();
  final _dadosFormulario = Map<String, Object>();
  //CONTROLADORES TEXTFIELD
  final txtId = new TextEditingController();
  final txtDesc = new TextEditingController();
  final txtQtde = new TextEditingController();
  final txtPrecoCusto = new TextEditingController();
  final txtPrecoFinal = new TextEditingController();
  final txtUndMed = new TextEditingController();
  //validar e criar nova Id

  void onInsert() {
    _formulario.currentState.save();

    final novoProduto = Produto(
      id: _dadosFormulario['id'],
      descricao: _dadosFormulario['descricao'],
      qtde: _dadosFormulario['qtde'],
      precoCusto: _dadosFormulario['precocusto'],
      precoFinal: _dadosFormulario['precofinal'],
      unMed: _dadosFormulario['unmed'],
    );
    Provider.of<ProdutoProvider>(context, listen: false)
        .createProduto(novoProduto);
  }

  //Iniciar estado
  @override
  void initState() {
    super.initState();
  }

  //CANCELAR O USO DE DETERMINADA FUNÇÃO
  @override
  void dispose() {
    super.dispose();
  }

  //CONSTRUÇÃO DO FORMULARIO
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formulario,
      child: ListView(
        children: [
          _body(),
          Container(
            child: _listarProduto(),
            height: 150,
            width: 300,
          ),
          _botaoEditarProduto(),
        ],
      ),
    );
  }

  //BODY DO FORMULARIO
  _body() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                _textFieldId(),
                _textFieldDesc(),
                _textFieldQtde(),
                _textFieldUnMed(),
                _textFieldPrecoCusto(),
                _textFieldPrecoFinal(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _botaoGuardarProduto(),
                    _botaoListarProduto(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //WIDGETS DE TEXTOS DOS FORMULARIOS
  _textFieldId() {
    return TextFormField(
      controller: txtId,
      decoration: InputDecoration(
        labelText: 'Codigo do produto: ',
        hintText: 'Deixar vazio',
      ),
      onSaved: (newValue) => _dadosFormulario['id'],
    );
  }

  _textFieldDesc() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Descrição do produto: ',
        hintText: 'Digite ...',
      ),
      onSaved: (newValue) => _dadosFormulario['descricao'],
    );
  }

  _textFieldPrecoCusto() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Preço de custo: ',
          hintText: 'Digite ...',
        ),
        onSaved: (newValue) => _dadosFormulario['precocusto']);
  }

  _textFieldPrecoFinal() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Seu preço de venda: ',
          hintText: 'Digite ...',
        ),
        onSaved: (newValue) => _dadosFormulario['precofinal']);
  }

  _textFieldQtde() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Quantidade em estoque: ',
          hintText: 'Digite ...',
        ),
        onSaved: (newValue) => _dadosFormulario['qtde']);
  }

  _textFieldUnMed() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Unidade de medida a ser utilizada: ',
          hintText: 'Digite (UN,LT,ML,KG) ...',
        ),
        onSaved: (newValue) => _dadosFormulario['unmed']);
  }

//WIDGETS BOTOES
  _botaoGuardarProduto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          onInsert();
        },
        child: Container(
          child: Text('Guardar Produto'),
        ),
      ),
    );
  }

  _botaoListarProduto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          child: Text('Listar Produtos'),
        ),
      ),
    );
  }

  _botaoEditarProduto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _listarProduto();
        },
        child: Container(
          child: Text(
            'Editar Produto',
          ),
        ),
      ),
    );
  }

  //WIDGET DE LISTA
  _listarProduto() {
    return FutureBuilder<List<Produto>>(
      future: pegarDadosJson(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView(
          children: snapshot.data
              .map(
                (produto) => ListTile(
                  title: Text(produto.descricao),
                  subtitle: Text(produto.qtde),
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
}
