import 'package:flutter/material.dart';

import 'package:lavacar/util/rotas.dart';
import 'package:lavacar/widget/drawer.dart';
import 'package:lavacar/widget/homepage.dart';

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
      title: 'LavaCar App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Lava Car - APP'),
      routes: {
        RotasApp.DRAWER: (ctx) => AppDrawer(),
      },
    );
  }
}
