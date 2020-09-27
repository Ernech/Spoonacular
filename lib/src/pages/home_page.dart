import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(items: _items());
  }

  List<BottomNavigationBarItem> _items() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), title: Text('Favoritos')),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), title: Text('Cuenta')),
    ];
  }
}
