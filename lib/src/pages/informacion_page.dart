import 'package:flutter/material.dart';

class InformacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la aplicación'),
      ),
      body: _info(),
    );
  }

  Widget _info() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Color.fromRGBO(0, 0, 0, 0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Esta app fue realizada con el propósito de presentar una prueba técnica para desarrollador de aplicaciones multiplataforma en Flutter.',
            style: _generalTextStyle(),
          ),
          SizedBox(height: 20),
          Text(
              'La misma tiene como intención controlar el registro de agrandamientos para canchas de tennis, tomando en cuenta la fecha y el pronostico de factores climáticos para el día de dichos registros.',
              style: _generalTextStyle()),
          SizedBox(height: 20),
          Text('Fecha de creación: 10 de octubre 2020',
              style: _generalTextStyle()),
          SizedBox(height: 6),
          Text(
            'Autor: Christian De La Cruz – christiandelacruz.site',
            style: _generalTextStyle(),
          ),
          SizedBox(height: 6),
          Text(
              'Enlace a Github del proyecto: https://github.com/DevCriss/ReservacionCanchas',
              style: _generalTextStyle()),
        ],
      ),
    );
  }

  TextStyle _generalTextStyle() {
    return TextStyle(fontSize: 20);
  }
}
