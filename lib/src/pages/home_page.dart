import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final preferences = new PreferenciasUsuario();
    preferences.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        centerTitle: true,
        backgroundColor:
            preferences.colorSecundario ? Colors.teal : Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario ${preferences.colorSecundario}'),
          Divider(),
          Text('Género ${preferences.genero}'),
          Divider(),
          Text('Nombre usuario ${preferences.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
