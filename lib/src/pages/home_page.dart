import 'package:flutter/material.dart';
import 'package:spoonacular/src/pages/cuenta_page.dart';
import 'package:spoonacular/src/pages/favoritos_page.dart';
import 'package:spoonacular/src/pages/inicio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cargarPagina(_currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      items: _items(),
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
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

  Widget _cargarPagina(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return InicioPage();
        break;
      case 1:
        return FavoritosPage();
        break;
      case 2:
        return CuentaPage();
        break;
      default:
        return InicioPage();
    }
  }
}
