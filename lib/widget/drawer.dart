import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            Column(
              children: [
                _drawerInfos(),
                Center(
                  child: ListTile(
                    leading: Icon(Icons.next_week_rounded),
                    title: Text('Ordens'),
                    onTap: () {},
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Clientes'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.home_repair_service),
                  title: Text('Serviços'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.invert_colors_on_outlined),
                  title: Text('Produtos'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text('Veiculos'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.car_repair),
                  title: Text('Estacionamento'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outlined,
                  ),
                  title: Text('Sobre'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.arrow_back,
                  ),
                  title: Text('Sair'),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_drawerInfos() {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
        ),
        CircleAvatar(
          child: Image.asset(
            'assets/image/carro.jpg',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text('data'),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text('data'),
      ],
    ),
  );
}
