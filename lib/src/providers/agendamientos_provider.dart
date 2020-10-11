import 'package:flutter/cupertino.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';
import 'package:reservacion_canchas/src/providers/db_provider.dart';

class AgendamientosProvider with ChangeNotifier {
  List<AgendamientoModel> _agendamientos = [];

  get agentamientos {
    if (_agendamientos.isEmpty) {
      _updateAgendamientos();
    }
    return _agendamientos;
  }

  Future<int> addAgendamiento(AgendamientoModel agendamiento) async {
    int res = await DBProvider.db.addAgendamiento(agendamiento);
    _updateAgendamientos();
    return res;
  }

  void _updateAgendamientos() async {
    final res = await DBProvider.db.getAgendamientos();
    _agendamientos = res;
    notifyListeners();
  }

  Future<int> deleteAgendamiento(int id) async {
    int res = await DBProvider.db.deleteAgendamiento(id);
    _updateAgendamientos();
    return res;
  }

  Future<bool> isAbleToSave(String fecha, String cancha) async {
    bool res = await DBProvider.db.isAbleToSave(fecha, cancha);

    return res;
  }
}
