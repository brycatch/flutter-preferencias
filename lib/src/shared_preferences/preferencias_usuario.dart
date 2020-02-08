import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance = new PreferenciasUsuario._();

  factory PreferenciasUsuario() {
    return _instance;
  }

  PreferenciasUsuario._();

  SharedPreferences _preferences;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // GET y SET del Género
  get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _preferences.setInt('genero', value);
  }

  // GET y SET del color secundario
  get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _preferences.setBool('colorSecundario', value);
  }

  // GET y SET del color secundario
  get nombreUsuario {
    return _preferences.getString('nombreUsuario') ?? 'Bryan';
  }

  set nombreUsuario(String value) {
    _preferences.setString('nombreUsuario', value);
  }

  // GET y SET del color secundario
  get ultimaPagina {
    return _preferences.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _preferences.setString('ultimaPagina', value);
  }
}
