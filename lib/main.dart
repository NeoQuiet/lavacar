import 'package:flutter/material.dart';
import 'package:lavacar/provider/marca.dart';

import 'package:lavacar/util/rotas.dart';
import 'package:lavacar/widget/drawer.dart';
import 'package:lavacar/widget/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: MyHomePage(),
      routes: {
        RotasApp.DRAWER: (ctx) => AppDrawer(),
      },
    );
  }
}
