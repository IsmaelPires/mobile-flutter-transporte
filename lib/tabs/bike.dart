import 'package:flutter/material.dart';
import './bus.dart';
import '../main.dart';

class BikeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => MyApp());
            Navigator.push(context, route);
          },
        ),
        title: Text("Bike"),
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
      ),
      body: buildGridList(context),
    );
  }

  Widget buildGridList(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      children: List.generate(50, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Linha $index',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        );
      }),
    );
  }
}