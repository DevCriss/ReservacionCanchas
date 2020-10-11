import 'package:flutter/cupertino.dart';

class FormularioProvider with ChangeNotifier {
  String _cancha = null;
  String _fecha = null;
  String _usuario = null;
  int _probabilidadLLuvia = null;
  int _humedad = null;
  int _temperatura = null;
  bool _loadingWeather = false;

  get cancha {
    return _cancha;
  }

  set cancha(String cancha) {
    _cancha = cancha;
    notifyListeners();
  }

  get fecha {
    return _fecha;
  }

  set fecha(String fecha) {
    _fecha = fecha;
    notifyListeners();
  }

  get usuario {
    return _usuario;
  }

  set usuario(String usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void resetForm() {
    _cancha = null;
    _fecha = null;
    _usuario = null;
    _probabilidadLLuvia = null;
    notifyListeners();
  }

  get probabilidadLluvia {
    return _probabilidadLLuvia;
  }

  set probabilidadLluvia(int probabilidad) {
    _probabilidadLLuvia = probabilidad;
    notifyListeners();
  }

  get loadingWeather {
    return _loadingWeather;
  }

  set loadingWeather(bool status) {
    _loadingWeather = status;
    notifyListeners();
  }

  get humedad {
    return _humedad;
  }

  set humedad(int humedad) {
    _humedad = humedad;
    notifyListeners();
  }

  get temperatura {
    return _temperatura;
  }

  set temperatura(int temp) {
    _temperatura = temp;
    notifyListeners();
  }
}
