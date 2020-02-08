import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  TextEditingController _textController;

  final preferences = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = preferences.genero;
    _colorSecundario = preferences.colorSecundario;
    _textController = TextEditingController(text: preferences.nombreUsuario);
    preferences.ultimaPagina = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          centerTitle: true,
          backgroundColor:
              preferences.colorSecundario ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  preferences.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona',
                ),
                onChanged: (value) {
                  preferences.nombreUsuario = value;
                },
              ),
            ),
          ],
        ));
  }

  _setSelectedRadio(int valor) {
    setState(() {
      _genero = valor;
      preferences.genero = valor;
    });
  }
}
