import 'package:flutter/material.dart';
import './tabs/bike.dart';
import './tabs/bus.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
        accountName: Text("Ismael Fernandes"),
        accountEmail: Text("ismaa_gyn@hotmail.com"),
        currentAccountPicture: CircleAvatar(
          child: Icon(Icons.person, size: 64.0),
          backgroundColor: Colors.white,
        ));
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('Minha conta'),
          leading: Icon(Icons.person, size: 31.0),
          onTap: () {},
        ),
        ListTile(
          title: Text('Configurações'),
          leading: Icon(Icons.settings, size: 31.0),
          onTap: () {},
        ),
        ListTile(
          title: Text('Sair'),
          leading: Icon(Icons.exit_to_app, size: 31.0),
        )
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: buildAppBar(context),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
    return scaffold;
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.redAccent,
      title: Text("Transporte"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.directions_bike),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => BikeHome());
            Navigator.push(context, route);
          },
        ),
        IconButton(
          icon: Icon(Icons.directions_bus),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => BusHome());
            Navigator.push(context, route);
          },
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text('Barco')),
              PopupMenuItem(child: Text('Trem')),
            ];
          },
        )
      ],
    );
  }
}
