import 'package:flutter/material.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';
import 'package:reservacion_canchas/src/providers/weather_provider.dart';

class DetallesAgendamiento extends StatelessWidget {
  AgendamientoModel agendamiento;
  WeatherProvider weatherProvider;
  @override
  Widget build(BuildContext context) {
    agendamiento = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles Agendamiento'),
      ),
      body: Container(
        child: ListView(
          children: [_image(), _data(), _weather()],
        ),
      ),
    );
  }

  Widget _image() {
    return Container(
      child: Hero(
        tag: agendamiento.id,
        child: Image(
          height: 250,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/Cancha${agendamiento.cancha}.jpg'),
        ),
      ),
    );
  }

  Widget _data() {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 10, color: Color.fromRGBO(0, 0, 0, 0.2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancha ${agendamiento.cancha}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Fecha de agendamiento: ${agendamiento.fecha}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Nombre del usuario: ${agendamiento.usuario}',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget _weather() {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 10, color: Color.fromRGBO(0, 0, 0, 0.2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pronostico del tiempo',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          agendamiento.probabilidadLluvia == null
              ? Text(
                  'No disponible',
                  style: TextStyle(fontSize: 18),
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _itemMedida('Probabilidad de lluvia',
                          '${agendamiento.probabilidadLluvia}%', Icons.grain),
                      _itemMedida(
                          'Humedad', '${agendamiento.humedad}%', Icons.cloud),
                      _itemMedida('Temperatura', '${agendamiento.temperatura}°',
                          Icons.whatshot),
                    ],
                  ),
                )
        ],
      ),
    );
  }

  Widget _itemMedida(String titulo, String valor, IconData icon) {
    return Container(
      child: Column(
        children: [
          Text(
            valor,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 16),
          ),
          Icon(
            icon,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
