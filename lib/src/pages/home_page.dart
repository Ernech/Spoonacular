import 'package:flutter/material.dart';
import 'package:spoonacular/src/pages/cuenta_page.dart';
import 'package:spoonacular/src/pages/inicio_page.dart';
import 'package:spoonacular/src/users_preferences/usersPreferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = PreferenciasUsuario();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cargarPagina(_currentIndex), //
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(80, 102, 0, 0.8),
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)))),
      child: BottomNavigationBar(
        backgroundColor: Color(0xFF5B8C2A),
        items: _items(),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text(prefs.idioma == 0 ? "Home" : "Inicio")),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          // ignore: deprecated_member_use
          title: Text(prefs.idioma == 0 ? "Account" : "Cuenta")),
    ];
  }

  Widget _cargarPagina(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return InicioPage();
        break;
      case 1:
        return CuentaPage();
        break;
      default:
        return InicioPage();
    }
  }
}
