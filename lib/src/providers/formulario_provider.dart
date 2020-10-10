import 'package:flutter/cupertino.dart';

class FormularioProvider with ChangeNotifier {
  String _cancha = null;
  String _fecha = null;
  String _usuario = null;

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
    notifyListeners();
  }
}
