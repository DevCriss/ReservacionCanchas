import 'package:flutter/material.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';

class Agendamiento extends StatelessWidget {
  AgendamientoModel agendamiento;
  Agendamiento({this.agendamiento});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(agendamiento.cancha),
    );
  }
}
