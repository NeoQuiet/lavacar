import 'package:flutter/material.dart';
import 'package:lavacar/provider/produto.dart';
import 'package:lavacar/util/rotas.dart';
import 'package:lavacar/view/ordens_page.dart';
import 'package:lavacar/view/produto_page.dart';

import 'package:lavacar/widget/drawer.dart';
import 'package:lavacar/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new ProdutoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        routes: {
          RotasApp.HOME_PAGE: (ctx) => MyHomePage(),
          RotasApp.DRAWER: (ctx) => AppDrawer(),
          RotasApp.ORDENS_PAGE: (ctx) => OrdensPage(),
          RotasApp.PRODUTO_PAGE: (ctx) => ProdutoPage(),
        },
      ),
    );
  }
}
