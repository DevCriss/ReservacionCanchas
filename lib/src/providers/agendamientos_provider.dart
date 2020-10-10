import 'package:flutter/cupertino.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';

class AgendamientosProvider with ChangeNotifier {
  List<AgendamientoModel> _agendamientos = [];

  get agentamientos {
    return _agendamientos;
  }
}
